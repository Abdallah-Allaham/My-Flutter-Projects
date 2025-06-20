import 'package:flutter/material.dart';
import 'package:flutter_mvvm/presentation/resources/styles_manager.dart';
import 'package:flutter_mvvm/presentation/resources/values_manager.dart';

import 'color_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary,
    // color of button ripple effect

    // card view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    //app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.lightPrimary,
      titleTextStyle: getRegularTextStyle(
        fontSize: AppSize.s16,
        color: ColorManager.white,
      ),
    ),

    // button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.lightPrimary,
    ),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularTextStyle(
          color: ColorManager.white,
          fontSize: AppSize.s18,
        ),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),

    // text theme
    textTheme: TextTheme(
      headlineLarge: getSemiBoldTextStyle(
        color: ColorManager.darkGrey,
        fontSize: AppSize.s16,
      ),
      headlineMedium: getRegularTextStyle(
        color: ColorManager.darkGrey,
        fontSize: AppSize.s14,
      ),
      bodyLarge: getRegularTextStyle(
        color: ColorManager.grey1,
      ),
      bodySmall: getRegularTextStyle(
        color: ColorManager.grey,
      ),
      displayLarge: getSemiBoldTextStyle(
        color: ColorManager.darkGrey,
        fontSize: AppSize.s16,
      ),
      titleMedium: getRegularTextStyle(color: ColorManager.lightGrey,
        fontSize: AppSize.s14,),
    ),


    // input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      //content padding
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      // hint style
      hintStyle: getRegularTextStyle(
        color: ColorManager.grey,
        fontSize: AppSize.s14,
      ),

      // label style
      labelStyle: getMediumTextStyle(
        color: ColorManager.grey,
        fontSize: AppSize.s14,
      ),

      //error style
      errorStyle: getRegularTextStyle(
        color: ColorManager.error,
      ),

      // enabled border
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary,width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      // focused border
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey,width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      // error border
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error,width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      // focused error border
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary,width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),
  );
}
