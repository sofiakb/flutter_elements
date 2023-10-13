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
      case CustomDialogIconsType.success:
        return FontAwesomeIcons.lightCheck;
      case CustomDialogIconsType.error:
        return FontAwesomeIcons.lightXmark;
      case CustomDialogIconsType.warning:
        return FontAwesomeIcons.lightExclamation;
      case CustomDialogIconsType.question:
        return FontAwesomeIcons.lightQuestion;
      case CustomDialogIconsType.info:
        return FontAwesomeIcons.lightInfo;
      default:
        return null;
    }
  }

  static String? getTitle(CustomDialogIconsType icon) {
    switch (icon) {
      case CustomDialogIconsType.success:
        return "Réussi";
      case CustomDialogIconsType.error:
        return "Aïe..";
      case CustomDialogIconsType.warning:
        return "Êtes-vous sûr(e) ?";
      case CustomDialogIconsType.question:
        return "Petite question..";
      case CustomDialogIconsType.info:
        return "Pour info..";
      default:
        return null;
    }
  }

  static Color? getColor(CustomDialogIconsType icon) {
    switch (icon) {
      case CustomDialogIconsType.success:
        return Colors.green;
      case CustomDialogIconsType.error:
        return Colors.red;
      case CustomDialogIconsType.warning:
        return Colors.orange;
      case CustomDialogIconsType.question:
        return Colors.purple;
      case CustomDialogIconsType.info:
        return Colors.cyan;
      default:
        return null;
    }
  }
}
