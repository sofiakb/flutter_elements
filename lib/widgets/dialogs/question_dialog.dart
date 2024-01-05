import 'package:sofiakb_elements/logic/custom_dialog/custom_dialog_icons_type.dart';

import 'custom_dialog.dart';

class QuestionDialog extends CustomDialogBox {
  const QuestionDialog(
      {super.key,
      super.text = "Êtes-vous sûr(e) ?",
      super.title,
      super.confirmButtonText =  "Oui",
      super.showConfirmButton = true,
      super.cancelButtonText = "Non",
      super.showCancelButton = true,
      super.icon = CustomDialogIconsType.question});
}
