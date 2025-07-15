import 'package:flutter/material.dart';
import 'package:law_sphere/features/home/presentation/views/home_view.dart';
import 'package:law_sphere/features/login/presentation/views/login_view.dart';
import 'package:law_sphere/features/onBoarding/presentation/views/on_boarding_view.dart';
import 'package:law_sphere/features/register/presentation/views/register_view.dart';
import 'package:law_sphere/features/splash/presentation/views/splash_view.dart';

import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingView:
        return MaterialPageRoute(builder: (_) => OnBoardingView());
      case Routes.loginView:
        return MaterialPageRoute(builder: (_) => const LoginView());

      case Routes.homeView:
        return MaterialPageRoute(builder: (_) => HomeView());
      case Routes.registerView:
        return MaterialPageRoute(builder: (_) => RegisterView());

      default:
        return MaterialPageRoute(builder: (_) => const SplashView());
    }
  }
}
