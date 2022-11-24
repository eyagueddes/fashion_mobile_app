import 'package:fashion_mobile_app/presentation/resources/color_manager.dart';
import 'package:fashion_mobile_app/presentation/resources/style_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme(){
  return ThemeData(
    textTheme: TextTheme(
      displayLarge:getSemiBold(color: ColorManager.white),
      displayMedium: getMeduim(color: ColorManager.white),
      displaySmall: getSmall(color: ColorManager.white),
      titleMedium: getTitleMeduim(color: ColorManager.black)
    )
  );
}