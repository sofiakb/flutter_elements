import 'package:sofiakb_elements/logic/custom_dialog/custom_dialog_icons_type.dart';

import 'custom_dialog.dart';

class SuccessDialog extends CustomDialogBox {
  const SuccessDialog(
      {super.key,
      super.text = "L'action s'est terminée avec succès.",
      super.title,
      super.confirmButtonText = "J'ai compris",
      super.showConfirmButton = true,
      super.cancelButtonText,
      super.showCancelButton = false,
      super.icon = CustomDialogIconsType.success});
}
