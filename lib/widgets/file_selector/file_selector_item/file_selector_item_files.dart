import 'package:flutter/cupertino.dart';
import 'package:sofiakb_elements/widgets/file_selector/file_selector_item/file_selector_item_child.dart';

class FileSelectorItemFiles extends FileSelectorItemChild {
  const FileSelectorItemFiles({
    super.key,
    required super.onChanged,
    super.icon = CupertinoIcons.folder,
    super.label = "Fichiers",
    super.bordered = true,
    super.type = FileSelectorItemType.file,
  });
}
