import 'package:flutter/material.dart';

import 'color_manager.dart';

class TextStyleManager {
  static TextStyle getRegularStyle({Color? color}) {
    return TextStyle(
      color: color ?? ColorManager.black,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle getTitleBoldStyle() {
    return const TextStyle(
      color: ColorManager.black,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle getButtonTextStyle() {
    return const TextStyle(
      color: ColorManager.white,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle getSubTitleBoldStyle() {
    return const TextStyle(
      color: ColorManager.black,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle getSecondaryRegularStyle() {
    return TextStyle(
      color: ColorManager.secondary,
      fontSize: 11,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle getCaptionStyle() {
    return const TextStyle(fontSize: 13, color: ColorManager.grey);
  }

  static TextStyle getBlackCaptionTextStyle() {
    return const TextStyle(
        fontSize: 11, color: ColorManager.black, fontWeight: FontWeight.bold);
  }

  static TextStyle getAppBarTextStyle() {
    return const TextStyle(
        fontWeight: FontWeight.w600, fontSize: 40, color: ColorManager.black);
  }
}
