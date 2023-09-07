import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/App_strings.dart';
import 'package:to_do_app/features/auth/screens/Splash_screen.dart';

import '../core/utils/App_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: AppStrings.AppName,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
