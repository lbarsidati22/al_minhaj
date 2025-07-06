import 'package:al_minhaj/core/utils/color/colors.dart';
import 'package:al_minhaj/core/utils/theme/font_family_helper.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // static bool isDark = false;

  static Color lightPrimaryColor = Color(
    0xFFB7935F,
  );
  static Color darkPrimaryColor = Color(
    0xFF141A2E,
  );
  static Color darkSecondary = Color(0xFFFACC1D);
  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness ==
        Brightness.dark;
  }

  static ThemeData lightTheme(
    String languageCode,
  ) {
    final fontFamily =
        FontFamilyHelper.getFontFamily(
          languageCode,
        );

    return ThemeData(
      colorScheme: ColorScheme.light(
        brightness: Brightness.light,
        primary:
            LightColors.instance.kPrimaryColor,
        onPrimary:
            LightColors.instance.kPajeColor,
        secondary:
            LightColors.instance.kSecondaryColor,
        error: Colors.red,
        onError: Colors.white,
        primaryContainer:
            LightColors.instance.kSecondaryColor,
        onPrimaryContainer:
            LightColors.instance.kPrimaryColor,
        surface:
            LightColors.instance.kBackgroundColor,
        onSurface:
            LightColors.instance.kBlackColor,
        onSecondaryContainer:
            LightColors.instance.kWhiteColor,
      ),
      fontFamily: fontFamily,
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.black,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(
          color: Colors.black,
        ),
        bodySmall: TextStyle(color: Colors.black),
        headlineSmall: TextStyle(
          color: Colors.black,
        ),
      ),
      scaffoldBackgroundColor:
          LightColors.instance.kBackgroundColor,

      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor:
            LightColors.instance.kBackgroundColor,
        foregroundColor:
            LightColors.instance.kPrimaryColor,

        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        titleTextStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),

      iconTheme: IconThemeData(),
      buttonTheme: ButtonThemeData(),

      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(
            backgroundColor: lightPrimaryColor,
            unselectedIconTheme: IconThemeData(
              color: Colors.white,
              size: 30,
            ),
            selectedIconTheme: IconThemeData(
              color: Colors.black,
              size: 30,
            ),
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white,
          ),
      dividerTheme: DividerThemeData(
        color: lightPrimaryColor,
        thickness: 2,
      ),
    );
  }

  static ThemeData darkTheme(
    String languageCode,
  ) {
    final fontFamily =
        FontFamilyHelper.getFontFamily(
          languageCode,
        );
    return ThemeData(
      colorScheme: ColorScheme.dark(
        brightness: Brightness.dark,
        primary:
            DarkColors.instance.kPrimaryColor,
        onPrimary: DarkColors.instance.kPajeColor,
        secondary:
            DarkColors.instance.kSecondaryColor,
        error: Colors.red,
        onError: Colors.white,
        primaryContainer:
            DarkColors.instance.kSecondaryColor,
        onPrimaryContainer:
            DarkColors.instance.kPrimaryColor,
        surface:
            DarkColors.instance.kBackgroundColor,
        onSurface:
            DarkColors.instance.kBlackColor,
        onSecondaryContainer:
            DarkColors.instance.kWhiteColor,
      ),
      fontFamily: fontFamily,
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: darkPrimaryColor,
      ),

      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(
          color: Colors.white,
        ),
        bodySmall: TextStyle(color: Colors.white),
        headlineSmall: TextStyle(
          color: Colors.white,
        ),
      ),
      scaffoldBackgroundColor:
          DarkColors.instance.kBackgroundColor,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor:
            DarkColors.instance.kBackgroundColor,
        foregroundColor:
            DarkColors.instance.kPrimaryColor,

        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        titleTextStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),

      iconTheme: IconThemeData(),
      buttonTheme: ButtonThemeData(),

      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(
            backgroundColor: darkPrimaryColor,
            unselectedIconTheme: IconThemeData(
              color: Colors.white,
              size: 30,
            ),
            selectedIconTheme: IconThemeData(
              color: darkSecondary,
              size: 30,
            ),
            selectedItemColor: darkSecondary,
            unselectedItemColor: Colors.white,
          ),
      dividerTheme: DividerThemeData(
        color: darkSecondary,
        thickness: 2,
      ),
    );
  }
}
