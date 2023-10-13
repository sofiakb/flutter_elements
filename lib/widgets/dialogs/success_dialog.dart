import 'package:flutter/material.dart';
import 'package:sofiakb_elements/logic/custom_dialog/custom_dialog_icons_type.dart';

import 'custom_dialog.dart';

class SuccessDialog extends CustomDialogBox {
  SuccessDialog(
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
            text: text ?? "L'action s'est terminée avec succès.",
            title: title,
            confirmButtonText: confirmButtonText ?? "J'ai compris",
            showConfirmButton: showConfirmButton ?? true,
            cancelButtonText: cancelButtonText,
            showCancelButton: showCancelButton ?? false,
            icon: icon ?? CustomDialogIconsType.success);
}
