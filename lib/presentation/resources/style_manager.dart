import 'dart:ui';

import 'package:fashion_mobile_app/presentation/resources/color_manager.dart';
import 'package:fashion_mobile_app/presentation/resources/font_manager.dart';
import 'package:fashion_mobile_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color){
  return TextStyle(
    height: AppSize.s1_5,
    fontSize:fontSize,
    color: color,
    fontWeight:fontWeight
  );
}

TextStyle getSemiBold({
  double fontSize = FontSize.s20, Color color = Colors.white
}){
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}

TextStyle getMeduim ({
  double fontSize = FontSize.s20, Color color = Colors.white
}){
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

TextStyle getSmall ({
  double fontSize = FontSize.s16, Color color = Colors.white
}){
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

TextStyle getTitleMeduim ({
  double fontSize = FontSize.s16, Color color = Colors.white
}){
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}
