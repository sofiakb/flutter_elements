import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sofiakb_elements/widgets/file_selector/file_selector_item/file_selector_item_child.dart';

class FileSelectorItemVideoGallery extends FileSelectorItemChild {
  const FileSelectorItemVideoGallery({
    super.key,
    required super.onChanged,
    super.icon = CupertinoIcons.videocam_circle,
    super.label = "Choisir une vidéo",
    super.bordered = true,
    super.type = FileSelectorItemType.video,
    super.source = ImageSource.gallery,
  });
}
