import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/them/them.dart';
import 'package:to_do_app/core/utils/App_strings.dart';

import '../features/auth/presention/screens/Splash/Splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return MaterialApp(
            title: AppStrings.AppName,
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
            theme: getAppTheme(),
            themeMode: ThemeMode.dark,
            darkTheme: getAppDarkTheme(),
          );
        });
  }
}
