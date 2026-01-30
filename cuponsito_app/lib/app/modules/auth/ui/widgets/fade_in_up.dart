import 'package:flutter/material.dart';

class FadeInUp extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double delay;
  final double offset;

  const FadeInUp({
    required this.child,
    this.duration = const Duration(milliseconds: 800),
    this.delay = 0,
    this.offset = 30.0,
    super.key,
  });

  @override
  State<FadeInUp> createState() => _FadeInUpState();
}

class _FadeInUpState extends State<FadeInUp>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _translate;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _translate = Tween<Offset>(
      begin: Offset(0, widget.offset),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    if (widget.delay == 0) {
      _controller.forward();
    } else {
      Future.delayed(
        Duration(milliseconds: (widget.delay * 1000).round()),
        () {
          if (mounted) _controller.forward();
        },
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: _translate.value,
          child: Opacity(
            opacity: _opacity.value,
            child: widget.child,
          ),
        );
      },
    );
  }
}
