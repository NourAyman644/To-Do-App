import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/core/utils/App_assetes.dart';
import 'package:to_do_app/features/auth/presention/screens/onBoarding/onBoardindScreens.dart';

import '../../../../../core/utils/App_colors.dart';
import '../../../../../core/utils/App_strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigation();
  }

  void navigation() {
    Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => onBoardingScreens())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.Path1),
            const SizedBox(
              height: 20,
            ),
            Text(
              AppStrings.AppName,
              style: GoogleFonts.lato(
                fontSize: 40,
                color: AppColors.white,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}
