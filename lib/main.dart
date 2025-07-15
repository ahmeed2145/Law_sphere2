import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:law_sphere/core/di/service_locator.dart';
import 'package:law_sphere/core/routing/app_router.dart';
import 'package:law_sphere/low_sphere.dart';

import 'global_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  setup();
  Bloc.observer = GlobalBlocObserver();
  runApp(LawSphere(appRouter: AppRouter()));
}
