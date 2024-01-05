import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sofiakb_elements/widgets/file_selector/file_selector_item/file_selector_item_child.dart';

class FileSelectorItemImageCamera extends FileSelectorItemChild {
  const FileSelectorItemImageCamera({
    super.key,
    required super.onChanged,
    super.icon = CupertinoIcons.camera,
    super.label = "Prendre une photo",
    super.bordered = true,
    super.type = FileSelectorItemType.image,
    super.source = ImageSource.camera,
  });
}
