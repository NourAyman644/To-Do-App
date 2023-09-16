import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/App_colors.dart';

ThemeData getAppDarkTheme() {
  return ThemeData(
    primaryColor: AppColors.primarycolor,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      color: AppColors.background,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      displayMedium: GoogleFonts.lato(
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
        color: AppColors.white.withOpacity(.87),
      ),
      displayLarge: GoogleFonts.lato(
        fontWeight: FontWeight.w700,
        fontSize: 32.sp,
        color: AppColors.white.withOpacity(.87),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.btncolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
        //enabled border
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        //fouced border
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        //hint
        hintStyle: GoogleFonts.lato(
          color: AppColors.white,
          fontSize: 16.sp,
        ),
        //fill color
        fillColor: AppColors.lightBlack,
        filled: true),
  );
}

ThemeData getAppTheme() {
  return ThemeData(
    primaryColor: AppColors.primarycolor,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      color: AppColors.white,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: AppColors.backColor,
      ),
    ),
    textTheme: TextTheme(
      displayMedium: GoogleFonts.lato(
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
        color: AppColors.background.withOpacity(.87),
      ),
      displayLarge: GoogleFonts.lato(
        fontWeight: FontWeight.w700,
        fontSize: 32.sp,
        color: AppColors.background.withOpacity(.87),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.btncolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}
