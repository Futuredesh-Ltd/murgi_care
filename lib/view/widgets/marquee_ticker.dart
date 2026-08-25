import 'dart:async';
import 'package:flutter/material.dart';

class MarqueeTicker extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final double velocity; // pixels per second

  const MarqueeTicker({
    super.key,
    required this.text,
    this.style,
    this.velocity = 40.0,
  });

  @override
  State<MarqueeTicker> createState() => _MarqueeTickerState();
}

class _MarqueeTickerState extends State<MarqueeTicker> {
  late ScrollController _scrollController;
  bool _isScrolling = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startLoopAnimation());
  }

  void _startLoopAnimation() async {
    if (_isScrolling || !mounted) return;
    _isScrolling = true;

    while (mounted && _scrollController.hasClients) {
      final maxScroll = _scrollController.position.maxScrollExtent;
      if (maxScroll <= 0) {
        await Future.delayed(const Duration(milliseconds: 500));
        continue;
      }

      final currentOffset = _scrollController.offset;
      final remaining = maxScroll - currentOffset;
      if (remaining <= 0) {
        _scrollController.jumpTo(0);
        continue;
      }

      final durationInMs = ((remaining / widget.velocity) * 1000).toInt();

      try {
        await _scrollController.animateTo(
          maxScroll,
          duration: Duration(milliseconds: durationInMs),
          curve: Curves.linear,
        );
        if (mounted && _scrollController.hasClients) {
          _scrollController.jumpTo(0);
        }
      } catch (_) {
        break;
      }
    }

    _isScrolling = false;
  }

  @override
  void didUpdateWidget(MarqueeTicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(0);
      }
      _startLoopAnimation();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final displayText = "${widget.text}       ★       ${widget.text}       ★       ${widget.text}";
    return SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          displayText,
          style: widget.style ?? const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
