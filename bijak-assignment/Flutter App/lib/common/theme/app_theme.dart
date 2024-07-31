import 'package:bijakassignment/common/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    ///App-Bar Theme
    appBarTheme: const AppBarTheme(color: AppColors.colorGreen),

    ///Elevated Button Theme
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ButtonStyle(
    //     /// Customize the color of the text button when pressed
    //     overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
    //       if (states.contains(MaterialState.pressed)) {
    //         /// Change to your desired color
    //         return AppColors.colorGreen.withOpacity(0.2);
    //       }
    //       /// Use the default overlay color if not pressed
    //       return null;
    //     }),
    //     /// Other customizations for the text button
    //     foregroundColor: MaterialStateProperty.resolveWith<Color?>((states) {
    //       if (states.contains(MaterialState.pressed)) {
    //         return AppColors.colorGreen; // Change to your desired color
    //       }
    //       return Colors.black; // Default color
    //     }),
    //   ),
    // ),

    ///Text-Field Decoration
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(
          color: AppColors.colorBlack,
          width: 1.0,
          strokeAlign: 1.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(
          color: AppColors.colorBlack,
          width: 1.0,
          strokeAlign: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(
          color: AppColors.colorBlack,
          width: 1.0,
          strokeAlign: 1.0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(
          color: AppColors.colorRed,
          width: 1.0,
          strokeAlign: 1.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(
          color: AppColors.colorRed,
          width: 1.0,
          strokeAlign: 1.0,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(
          color: AppColors.colorGrey,
          width: 1.0,
          strokeAlign: 1.0,
        ),
      ),
    ),
  );
}
