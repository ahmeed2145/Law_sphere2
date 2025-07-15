import 'package:flutter/material.dart';
import 'package:law_sphere/core/routing/routes.dart';
import 'package:law_sphere/features/splash/presentation/views/widgets/fade_animation.dart';
import 'package:law_sphere/features/splash/presentation/views/widgets/sliding_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAndFadeAnimation();

    navigateToHomeView();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AnimatedLogo(fadeAnimation: fadeAnimation),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initSlidingAndFadeAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 10),
      end: Offset.zero,
    ).animate(animationController);

    fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1,
    ).animate(animationController);

    animationController.forward();
  }

  void navigateToHomeView() {
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        Navigator.pushNamed(context, Routes.onBoardingView);
      }
    });
  }
}
