import 'package:sofiakb_elements/logic/custom_dialog/custom_dialog_icons_type.dart';

import 'custom_dialog.dart';

class ErrorDialog extends CustomDialogBox {
  const ErrorDialog(
      {super.key,
      super.text = "Une erreur est survenue, merci de réessayer plus tard.",
      super.title,
      super.confirmButtonText = "J'ai compris",
      super.showConfirmButton = true,
      super.cancelButtonText,
      super.showCancelButton = false,
      super.icon = CustomDialogIconsType.error});
}
