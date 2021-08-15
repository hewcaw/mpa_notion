import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  // primarySwatch: Colors.yellow,
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: NotionColors.bg,
  fontFamily: 'Dosis',
  textTheme: const TextTheme(
    headline6: TextStyle(
      // fontFamily: 'Corben',
      // fontWeight: FontWeight.w700,
      // fontSize: 24,
      // color: Colors.black,
      fontWeight: FontWeight.w700,
      color: AppColors.fg,
    ),
    subtitle1: TextStyle(
      color: AppColors.fg,
    ),
    subtitle2: TextStyle(
      color: AppColors.fg,
    ),
    bodyText1: TextStyle(
      color: AppColors.fg,
    ),
    bodyText2: TextStyle(
      color: AppColors.fg,
    ),
    caption: TextStyle(
      color: AppColors.fg,
      // fontWeight: FontWeight.w500,
    ),
  ).apply(
    bodyColor: AppColors.fg,
    displayColor: AppColors.fg,
  ),
);

/// Dark mode only.
class NotionColors {
  static const Color fg = Color(0xe6FFFFFF);
  static const Color bg = Color(0xff2F3437);
  static const Color fgOrange = Color(0xffFFA344);
  static const Color fgYellow = Color(0xffFFDC49);
  static const Color fgGreen = Color(0xff4DAB9A);
  static const Color fgBlue = Color(0xff529CCA);
  static const Color fgPurple = Color(0xff9A6DD7);
}

class AppColors {
  static const Color fg = Color(0xffFAFAFA);
  static const Color fgGray = Color(0xff5e5e5e);
}

class Routes {
  static const goalTracker = '/goal_tracker';
}
