import 'package:flutter/cupertino.dart';
import 'package:sofiakb_elements/widgets/file_selector/file_selector_item/file_selector_item_child.dart';

class FileSelectorItemImageGallery extends FileSelectorItemChild {
  const FileSelectorItemImageGallery(
      {super.key,
      required super.onChanged,
      super.icon = CupertinoIcons.photo,
      super.label = "Choisir une photo",
      super.bordered = true});
}
