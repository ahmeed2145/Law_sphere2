import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:law_sphere/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:law_sphere/core/routing/routes.dart';
import 'package:law_sphere/generated/l10n.dart';

class LawSphere extends StatelessWidget {
  final AppRouter appRouter;
  const LawSphere({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
       locale: Locale('ar'),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.loginView,

        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
