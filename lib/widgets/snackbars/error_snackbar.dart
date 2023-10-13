import 'package:flutter/material.dart';
import 'package:sofiakb_elements/widgets/snackbars/custom_snackbar.dart';

class ErrorSnackbar extends CustomSnackbar {
  const ErrorSnackbar(
      {Key? key,
      super.content,
      super.backgroundColor = Colors.red,
      super.behavior,
      super.margin,
      super.elevation,
      super.text});

  @override
  void show(context) {
    final snackBar = SnackBar(
      content: content ?? Text(text!),
      backgroundColor: backgroundColor,
      behavior: behavior ?? SnackBarBehavior.floating,
      margin: margin,
      elevation: elevation,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
