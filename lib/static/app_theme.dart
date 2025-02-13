import 'package:flutter/material.dart';
import 'package:news/class/app_colors.dart';
import 'package:news/static/app_text_theme.dart';
import 'package:news/static/appbar_theme.dart';

ThemeData appTheme = ThemeData(
  textTheme: textThemeApp,
  scaffoldBackgroundColor: AppColors.secondary,
  appBarTheme: appBarTheme,
);

ThemeData themeDark = ThemeData(
  textTheme: textThemeApp,
  scaffoldBackgroundColor: AppColors.primary,
  appBarTheme: appBarTheme,
);
