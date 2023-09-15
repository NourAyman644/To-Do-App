import 'package:flutter/material.dart';
import 'package:to_do_app/core/datebase/cache.dart';
import 'package:to_do_app/core/utils/App_assetes.dart';
import 'package:to_do_app/features/Task/screens/home.dart';
import 'package:to_do_app/features/auth/presention/screens/onBoarding/onBoardindScreens.dart';

import '../../../../../core/services/services_Locator.dart';
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
    bool visit =
        sl<CacheHelper>().getData(key: AppStrings.onBoardingKey) ?? false;

    Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    visit ? HomeScreen() : onBoardingScreens())));
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
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 40,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
