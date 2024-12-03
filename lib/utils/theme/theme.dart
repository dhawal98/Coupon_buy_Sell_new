import 'package:coupon_app/utils/theme/custom_themes/appbar_theme.dart';
import 'package:coupon_app/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:coupon_app/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:coupon_app/utils/theme/custom_themes/chip_theme.dart';
import 'package:coupon_app/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:coupon_app/utils/theme/custom_themes/outlined_button.dart';
import 'package:coupon_app/utils/theme/custom_themes/text_field_theme.dart';
import 'package:coupon_app/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme{
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.brown,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckBoxTheme.lightCheckBoxTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Poppins',
  brightness: Brightness.dark,
  primaryColor: Colors.brown,
  scaffoldBackgroundColor: Colors.black,
  textTheme: TTextTheme.darkTextTheme,
  chipTheme: TChipTheme.darkChipTheme,
  appBarTheme: TAppBarTheme.darkAppBarTheme,
  checkboxTheme: TCheckBoxTheme.darkCheckBoxTheme,
  bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
  outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
  elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
  inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  
  );

}