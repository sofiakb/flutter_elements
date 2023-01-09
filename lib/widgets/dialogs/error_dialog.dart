import 'package:flutter/material.dart';
import 'package:sofiakb_elements/logic/custom_dialog/custom_dialog_icons_type.dart';

import 'custom_dialog.dart';

class ErrorDialog extends CustomDialogBox {
  ErrorDialog(
      {Key? key,
      text,
      title,
      confirmButtonText,
      showConfirmButton,
      cancelButtonText,
      showCancelButton,
      icon})
      : super(
            key: key,
            text: text ??
                "Une erreur est survenue, merci de réessayer plus tard.",
            title: title,
            confirmButtonText: confirmButtonText ?? "J'ai compris",
            showConfirmButton: showConfirmButton ?? true,
            cancelButtonText: cancelButtonText,
            showCancelButton: showCancelButton ?? false,
            icon: icon ?? CustomDialogIconsType.ERROR);
}
