// ignore_for_file: camel_case_types, camel_case_extensions, non_constant_identifier_names

import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const double designWidth = 750;
const double designHeight = 1334;
const double defaultWidth = 390;
const double defaultHeight = 844;

class scaleLayout {
  static late scaleLayout _instance;
  static Size physicalSize = const Size(designWidth, designHeight);
  late Orientation orientation;
  final bool _splitScreen = true;
  double screenWidth = defaultWidth;
  double screenHeight = defaultHeight;

  bool minTextRatio = true;
  double aspectRatio = 1;

  Size designSize = const Size(designWidth, designHeight);
  Size defaultSize = const Size(defaultWidth, defaultHeight);
  double scale = 1.0;

  double textScaleFactor = 1;
  double pixelRatio = 1;
  double statusBarHeight = 0;
  double bottomBarHeight = 0;

  scaleLayout._();

  factory scaleLayout() {
    return _instance;
  }

  static void init(bool minTextRatio, Orientation orientation, Size screenSize, Size defaultSize, Size designSize) {
    try {
      _instance = scaleLayout._()
        ..minTextRatio = minTextRatio
        ..orientation = orientation
        ..defaultSize = defaultSize
        ..designSize = designSize
        ..aspectRatio = window.physicalSize.aspectRatio
        ..textScaleFactor = window.platformDispatcher.textScaleFactor
        ..pixelRatio = window.devicePixelRatio
        ..screenWidth = screenSize.width
        ..screenHeight = screenSize.height
        ..statusBarHeight = Get.statusBarHeight
        ..bottomBarHeight = Get.bottomBarHeight;
      physicalSize = window.physicalSize;
    } catch (e) {
      return;
    }
  }

  double get scaleWidth => screenWidth / designSize.width;
  double get scaleHeight => (_splitScreen ? max(screenHeight, 700) : screenHeight) / designSize.height;

  double get scaleText => minTextRatio ? min(scaleWidth, scaleHeight) : scaleWidth;
  double setWidth(num width) => width * scaleWidth;
  double setHeight(num height) => height * scaleHeight;
  double radius(num r) {
    return r * min(scaleWidth, scaleHeight);
  }

  double radiusWH(num r) => r * scale;
  double radiusText(num fontSize) => fontSize * scaleText;
  Widget setVerticalSpacing(num height) => SizedBox(height: setHeight(height));
  Widget setVerticalSpacingFromWidth(num height) => SizedBox(height: setWidth(height));
  Widget setHorizontalSpacing(num width) => SizedBox(width: setWidth(width));
  Widget setHorizontalSpacingRadius(num width) => SizedBox(width: radius(width));
  Widget setVerticalSpacingRadius(num height) => SizedBox(height: radius(height));
}

extension sizeExtension on num {
  double get w => scaleLayout().setWidth(this);
  double get h => scaleLayout().setHeight(this);
  double get r => scaleLayout().radius(this);
  double get ra => scaleLayout().radiusWH(this);
  double get rt => scaleLayout().radiusText(this);
  double get sm => min(toDouble(), rt);
  double get sw => scaleLayout().screenWidth * this;
  double get sh => scaleLayout().screenHeight * this;

  Widget get verticalSpace => scaleLayout().setVerticalSpacing(this);
  Widget get verticalSpaceFromWidth => scaleLayout().setVerticalSpacingFromWidth(this);
  Widget get horizontalSpace => scaleLayout().setHorizontalSpacing(this);
  Widget get horizontalSpaceRadius => scaleLayout().setHorizontalSpacingRadius(this);
  Widget get verticalSpacingRadius => scaleLayout().setVerticalSpacingRadius(this);
}
