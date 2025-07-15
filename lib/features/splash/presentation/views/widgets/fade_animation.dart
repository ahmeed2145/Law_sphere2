import 'package:flutter/material.dart';

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({super.key, required this.fadeAnimation});

  final Animation<double> fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: fadeAnimation,
      builder: (context, _) {
        return FadeTransition(
          opacity: fadeAnimation,
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
