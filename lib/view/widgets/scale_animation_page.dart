import 'package:flutter/material.dart';

class ScaleAnimationPage extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;
  final double initialScale;
  final double finalScale;

  const ScaleAnimationPage({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeOutBack,
    this.initialScale = 0.92,
    this.finalScale = 1.0,
  });

  @override
  State<ScaleAnimationPage> createState() => _ScaleAnimationPageState();
}

class _ScaleAnimationPageState extends State<ScaleAnimationPage> {
  bool _animate = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() => _animate = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _animate ? widget.finalScale : widget.initialScale,
      duration: widget.duration,
      curve: widget.curve,
      child: widget.child,
    );
  }
}
