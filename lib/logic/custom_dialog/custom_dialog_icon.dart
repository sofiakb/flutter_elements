import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_dialog_icons_type.dart';

class CustomDialogIcon {
  IconData? icon;
  CustomDialogIconsType type;
  Color? color;
  String? title;

  CustomDialogIcon({this.icon, required this.type, this.color, this.title});

  static CustomDialogIcon fromIconType(CustomDialogIconsType iconType) =>
      CustomDialogIcon(
          type: iconType,
          title: CustomDialogIcon.getTitle(iconType),
          color: CustomDialogIcon.getColor(iconType),
          icon: CustomDialogIcon.getIcon(iconType));

  static IconData? getIcon(CustomDialogIconsType icon) {
    switch (icon) {
      case CustomDialogIconsType.SUCCESS:
        return FontAwesomeIcons.lightCheck;
      case CustomDialogIconsType.ERROR:
        return FontAwesomeIcons.lightXmark;
      case CustomDialogIconsType.WARNING:
        return FontAwesomeIcons.lightExclamation;
      case CustomDialogIconsType.QUESTION:
        return FontAwesomeIcons.lightQuestion;
      case CustomDialogIconsType.INFO:
        return FontAwesomeIcons.lightInfo;
      default:
        return null;
    }
  }

  static String? getTitle(CustomDialogIconsType icon) {
    switch (icon) {
      case CustomDialogIconsType.SUCCESS:
        return "Réussi";
      case CustomDialogIconsType.ERROR:
        return "Aïe..";
      case CustomDialogIconsType.WARNING:
        return "Êtes-vous sûr(e) ?";
      case CustomDialogIconsType.QUESTION:
        return "Petite question..";
      case CustomDialogIconsType.INFO:
        return "Pour info..";
      default:
        return null;
    }
  }

  static Color? getColor(CustomDialogIconsType icon) {
    switch (icon) {
      case CustomDialogIconsType.SUCCESS:
        return Colors.green;
      case CustomDialogIconsType.ERROR:
        return Colors.red;
      case CustomDialogIconsType.WARNING:
        return Colors.orange;
      case CustomDialogIconsType.QUESTION:
        return Colors.purple;
      case CustomDialogIconsType.INFO:
        return Colors.cyan;
      default:
        return null;
    }
  }
}
