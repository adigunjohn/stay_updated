import 'package:flutter/material.dart';
import 'package:stay_updated/ui/common/styles.dart';

///MediaQuery.of(context).platformBrightness == Brightness.light ? Colors.black : Colors.white,

class AppTheme {
  ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(),
    scaffoldBackgroundColor: Colors.grey.shade100,
    cardColor: Colors.white,  //for prehome button
    // hintColor: Colors.red,
    textTheme: TextTheme(
      displayLarge: kTSplashText.copyWith(color: Colors.black),
      bodyLarge: kTButtonText.copyWith(color: Colors.black),
      bodyMedium: kTBigText.copyWith(color: Colors.black),
      bodySmall: kTBodyText1.copyWith(),
      titleLarge: kTTitleText.copyWith(color: Colors.black),
      titleMedium: kTBoldSubtitleText.copyWith(color: Colors.black),
      titleSmall: kTSubtitleText.copyWith(color: Colors.black),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
  );

  ThemeData darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(),
    scaffoldBackgroundColor: Colors.black87,
    cardColor: Colors.black87, //for prehome button
    // hintColor: Colors.white,
    textTheme: TextTheme(
      displayLarge: kTSplashText.copyWith(color: Colors.white),
      bodyLarge: kTButtonText.copyWith(color: Colors.white),
      bodyMedium: kTBigText.copyWith(color: Colors.white),
      bodySmall: kTBodyText1.copyWith(),
      titleLarge: kTTitleText.copyWith(color: Colors.white),
      titleMedium: kTBoldSubtitleText.copyWith(color: Colors.white),
      titleSmall: kTSubtitleText.copyWith(color: Colors.white),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  );

}
