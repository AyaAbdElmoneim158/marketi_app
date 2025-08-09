import 'package:app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    // fontFamily: AppStrings.appFontName,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.white,
      // color: Colors.,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),

    textTheme: TextTheme(),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.lightBlue100, // 🔵 Global cursor color
      selectionColor: AppColors.lightBlue100.withOpacity(0.4), // optional
      selectionHandleColor: AppColors.lightBlue100, // optional
    ),
    inputDecorationTheme: InputDecorationTheme(
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(
          color: AppColors.rect.withOpacity(0.70),
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(
          color: AppColors.lightBlue100,
          width: 2,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(
          color: AppColors.lightBlue700,
          width: 2,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(
          color: AppColors.rect.withOpacity(0.70),
          width: 2,
        ),
      ),
      // focusedBorder ....
      fillColor: AppColors.white,
      filled: true,
      isDense: true,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 16,
      ),
      prefixIconColor: AppColors.darkBlue900,
      suffixIconColor: AppColors.darkBlue900,
      hintStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all(AppColors.white),
      fillColor: WidgetStateProperty.all(AppColors.lightBlue100),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.lightBlue100),
        foregroundColor: WidgetStateProperty.all(AppColors.white),
        elevation: WidgetStateProperty.all(0),
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 14, vertical: 16)),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
        textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(AppColors.lightBlue100),
        backgroundColor: WidgetStatePropertyAll(AppColors.white),
        elevation: WidgetStatePropertyAll(0),
        // 🧽 Remove splash/overlay effects
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
        splashFactory: NoSplash.splashFactory,
      ),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: AppColors.white,
      titleTextStyle: TextStyle(
        color: AppColors.darkBlue900,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
      ),
      contentTextStyle: TextStyle(
        color: AppColors.darkBlue900.withOpacity(0.85),
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      modalElevation: 12,
      showDragHandle: true,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.lightBlue100,
      contentTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 6,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      mouseCursor: WidgetStatePropertyAll(MouseCursor.uncontrolled),
      selectedItemColor: AppColors.lightBlue100,
      unselectedItemColor: AppColors.navy,
      backgroundColor: Colors.transparent,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedIconTheme: IconThemeData(size: 20, color: AppColors.lightBlue100),
      unselectedIconTheme: IconThemeData(size: 18, color: AppColors.grayScale),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(
        color: AppColors.lightBlue100,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: TextStyle(
        color: AppColors.grayScale,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.darkBlue900,
    scaffoldBackgroundColor: AppColors.bgBlue1500,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBlue900,
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: AppColors.white.withOpacity(0.7),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
