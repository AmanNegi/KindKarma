import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimatedBackground extends StatefulWidget {
  final Color color;
  const AnimatedBackground({super.key, this.color = Colors.white});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
      lowerBound: 0,
      upperBound: pi,
    );
    super.initState();
    animationController.repeat(reverse: false);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(animationController),
          // angle: animationController.value,
          child: child,
        );
      },
      child: ScaleTransition(
        scale: Tween(begin: 0.0, end: 1.0).animate(animationController),

        // scale: isLoading ? 0.75 : 1.5,
        child: SvgPicture.asset(
          "assets/paths.svg",
          color: widget.color.withOpacity(0.2),
        ),
      ),
    );
  }
}
