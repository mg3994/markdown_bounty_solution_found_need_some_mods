import 'package:flutter/material.dart';

class FadeIn extends StatefulWidget {
  const FadeIn({super.key, this.fadeDuration = 500, required this.child});

  final int fadeDuration;
  final Widget child;

  @override
  State<FadeIn> createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void didUpdateWidget(covariant FadeIn oldWidget) {
    if (oldWidget.child != widget.child) {
      _controller.reset();
      _controller.forward();
    }
    // if (oldWidget.fadeDuration != widget.fadeDuration) {
    //   _controller.dispose();
    //   _controller = AnimationController(
    //     duration: Duration(milliseconds: widget.fadeDuration),
    //     vsync: this,
    //   );
    //   _fadeAnimation =
    //       CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    //   _controller.forward();
    // }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: widget.fadeDuration),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: widget.child,
    );
  }
}
