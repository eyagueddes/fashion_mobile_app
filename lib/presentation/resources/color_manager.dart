
import 'package:flutter/material.dart';

class ColorManager {
  static Color black = HexColor.fromHex("#000000");
  static Color lightBlack = HexColor.fromHex("#3B3B3B");
  static Color grey = HexColor.fromHex("#F1F1F1");
  static Color orange = HexColor.fromHex("#F65824");
  static Color violet = HexColor.fromHex("#AFA7DB");
  static Color lightGrey = HexColor.fromHex("#F8F8F8");
  static Color primaryOpacity70 = HexColor.fromHex("#B3ED9728");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color darkGrey = HexColor.fromHex("#D6D6D8");
  static Color yellow = HexColor.fromHex("#FBFF36");
  static Color pink = HexColor.fromHex("#F4B6C7");
  static Color transaprentWhite =Color(0xB3FFFFFF);
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
