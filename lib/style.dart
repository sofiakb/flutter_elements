import 'package:flutter/material.dart';

double _toSpaceSize({double size = 1, double baseSize = 1}) => baseSize * size;

class XPadding {
  static final XPadding _instance = XPadding._internal();

  factory XPadding() {
    return _instance;
  }

  XPadding._internal();

  // padding
  double _paddingSize = 8.0;

  set paddingSize(double value) => _paddingSize = value;

  static setPaddingSize(double value) => XPadding().paddingSize = value;

  static double _toPaddingSize({double? size = 1}) =>
      _toSpaceSize(size: size ?? 1, baseSize: XPadding()._paddingSize);

  static EdgeInsets padding(
          {double top = 0,
          double bottom = 0,
          double right = 0,
          double left = 0}) =>
      EdgeInsets.only(
        top: _toPaddingSize(size: top),
        bottom: _toPaddingSize(size: bottom),
        left: _toPaddingSize(size: left),
        right: _toPaddingSize(size: right),
      );

  static EdgeInsets all([
    double? size,
  ]) =>
      EdgeInsets.all(_toPaddingSize(size: size));

  static EdgeInsets top([double? size]) =>
      EdgeInsets.only(top: _toPaddingSize(size: size));

  static EdgeInsets bottom([double? size]) =>
      EdgeInsets.only(bottom: _toPaddingSize(size: size));

  static EdgeInsets left([double? size]) =>
      EdgeInsets.only(left: _toPaddingSize(size: size));

  static EdgeInsets right([double? size]) =>
      EdgeInsets.only(right: _toPaddingSize(size: size));

  static EdgeInsets vertical([double? size]) =>
      EdgeInsets.symmetric(vertical: _toPaddingSize(size: size));

  static EdgeInsets horizontal([double? size]) =>
      EdgeInsets.symmetric(horizontal: _toPaddingSize(size: size));

  static EdgeInsets symmetric({double? vertical = 0, double? horizontal = 0}) =>
      EdgeInsets.symmetric(
          horizontal: _toPaddingSize(size: horizontal),
          vertical: _toPaddingSize(size: vertical));
}

class XRounded {
  static final XRounded instance = XRounded._internal();

  factory XRounded() {
    return instance;
  }

  XRounded._internal();

  // border radius
  double _borderRadius = 15.0;

  set borderRadius(double value) => _borderRadius = value;

  static setBorderRadius(double value) => XRounded.instance._borderRadius = value;

  static BorderRadius all = BorderRadius.circular(XRounded.instance._borderRadius);

  static BorderRadius top = BorderRadius.only(
      topLeft: Radius.circular(XRounded.instance._borderRadius),
      topRight: Radius.circular(XRounded.instance._borderRadius));

  static BorderRadius bottom = BorderRadius.only(
      bottomLeft: Radius.circular(XRounded.instance._borderRadius),
      bottomRight: Radius.circular(XRounded.instance._borderRadius));

  static BorderRadius left = BorderRadius.only(
      bottomLeft: Radius.circular(XRounded.instance._borderRadius),
      topLeft: Radius.circular(XRounded.instance._borderRadius));

  static BorderRadius right = BorderRadius.only(
      bottomRight: Radius.circular(XRounded.instance._borderRadius),
      topRight: Radius.circular(XRounded.instance._borderRadius));

  static BorderRadius circle = BorderRadius.circular(1000.0);
}

class AppStyle {
  static final AppStyle instance = AppStyle._internal();

  factory AppStyle() {
    return instance;
  }

  AppStyle._internal();

  // colors
  Color primaryColor = const Color(0xFF7380EC);
  Color secondaryColor = const Color(0xFF000000);
  Color lightColor = const Color(0xFF9FA6B2);

  static EdgeInsets Function(
      {double bottom,
      double left,
      double right,
      double top}) padding = XPadding.padding;

  static EdgeInsets Function([double? size]) paddingAll = XPadding.all;

  static EdgeInsets Function([double? size]) paddingTop = XPadding.top;

  static EdgeInsets Function([double? size]) paddingBottom = XPadding.bottom;

  static EdgeInsets Function([double? size]) paddingLeft = XPadding.left;

  static EdgeInsets Function([double? size]) paddingRight = XPadding.right;

  static EdgeInsets Function([double? size]) paddingVertical =
      XPadding.vertical;

  static EdgeInsets Function([double size]) paddingHorizontal =
      XPadding.horizontal;

  static EdgeInsets Function({double? vertical, double? horizontal})
      paddingSymmetric = XPadding.symmetric;

  // border radius
  static BorderRadius rounded = XRounded.all;
  static BorderRadius roundedTop = XRounded.top;
  static BorderRadius roundedBottom = XRounded.bottom;
  static BorderRadius roundedLeft = XRounded.left;
  static BorderRadius roundedRight = XRounded.right;
  static BorderRadius roundedCircle = XRounded.circle;

  static setSecondaryColor(Color value) => AppStyle.instance.secondaryColor = value;

  static setPrimaryColor(Color value) => AppStyle.instance.primaryColor = value;

  static setLightColor(Color value) => AppStyle.instance.lightColor = value;
}
