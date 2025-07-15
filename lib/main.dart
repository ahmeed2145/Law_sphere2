

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/service_locator.dart';
import 'core/routing/app_router.dart';
import 'global_bloc_observer.dart';
import 'low_sphere.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  setup();
  Bloc.observer = GlobalBlocObserver();
  runApp(LawSphere(appRouter: AppRouter()));
}
