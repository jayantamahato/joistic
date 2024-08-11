import 'package:flutter/material.dart';

import '../colors/colors.dart';

class AppTheme {
  static ThemeData dark() {
    return ThemeData(
        scaffoldBackgroundColor: AppColors.darkScaffold,
        brightness: Brightness.dark,
        primaryColor: AppColors.primaryColor,
        appBarTheme: AppBarTheme(
            centerTitle: true,
            color: AppColors.darkScaffold,
            surfaceTintColor: AppColors.darkScaffold));
  }

  static ThemeData light() {
    return ThemeData(
        scaffoldBackgroundColor: AppColors.lightScaffold,
        brightness: Brightness.light,
        primaryColor: AppColors.primaryColor,
        appBarTheme: AppBarTheme(
            centerTitle: true,
            color: AppColors.lightScaffold,
            surfaceTintColor: AppColors.lightScaffold));
  }
}
