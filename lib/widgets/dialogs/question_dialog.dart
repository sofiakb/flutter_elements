import 'package:flutter/material.dart';
import 'package:sofiakb_elements/logic/custom_dialog/custom_dialog_icons_type.dart';

import 'custom_dialog.dart';

class QuestionDialog extends CustomDialogBox {
  QuestionDialog(
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
            text: text ?? "Êtes-vous sûr(e) ?",
            title: title,
            confirmButtonText: confirmButtonText ?? "Oui",
            showConfirmButton: showConfirmButton ?? true,
            cancelButtonText: cancelButtonText ?? "Non",
            showCancelButton: showCancelButton ?? true,
            icon: icon ?? CustomDialogIconsType.QUESTION);
}
