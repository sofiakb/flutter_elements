import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sofiakb_elements/widgets/file_selector/file_selector_item/file_selector_item_child.dart';

class FileSelectorItemVideoCamera extends FileSelectorItemChild {
  const FileSelectorItemVideoCamera({
    super.key,
    required super.onChanged,
    super.icon = CupertinoIcons.videocam,
    super.label = "Prendre une vidéo",
    super.bordered = true,
    super.type = FileSelectorItemType.video,
    super.source = ImageSource.camera,
  });
}
