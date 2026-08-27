import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final scaleAnimationTriggerProvider =
    StateProvider.autoDispose.family<bool, String>((ref, id) => false);

class ScaleAnimationPage extends ConsumerStatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;
  final double initialScale;
  final double finalScale;
  final String id;

  const ScaleAnimationPage({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeOutBack,
    this.initialScale = 0.92,
    this.finalScale = 1.0,
    this.id = 'default_scale',
  });

  @override
  ConsumerState<ScaleAnimationPage> createState() => _ScaleAnimationPageState();
}

class _ScaleAnimationPageState extends ConsumerState<ScaleAnimationPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        ref
            .read(scaleAnimationTriggerProvider(widget.id).notifier)
            .state = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final animate = ref.watch(scaleAnimationTriggerProvider(widget.id));

    return AnimatedScale(
      scale: animate ? widget.finalScale : widget.initialScale,
      duration: widget.duration,
      curve: widget.curve,
      child: widget.child,
    );
  }
}
