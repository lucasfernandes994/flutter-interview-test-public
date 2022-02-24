import 'package:flutter/material.dart';

import 'colors.dart';

class Themes {
  static ThemeData appTheme(BuildContext context) => ThemeData(
        backgroundColor: AppColors.primaryColor,
        brightness: Brightness.light,
        textTheme: Theme.of(context).textTheme,
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: AppColors.primaryColor).copyWith(secondary: AppColors.accentColor),
      );
}
