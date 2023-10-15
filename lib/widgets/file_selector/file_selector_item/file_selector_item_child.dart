import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sofiakb_elements/widgets.dart';
import 'package:sofiakb_elements/widgets/file_selector/file_selector_utils.dart';

import 'file_selector_item.dart';

enum FileSelectorItemType { image, file }

class FileSelectorItemChild extends StatelessWidget {
  const FileSelectorItemChild(
      {super.key,
      required this.icon,
      required this.onChanged,
      required this.label,
      this.type = FileSelectorItemType.image,
      this.source,
      this.bordered = true});

  final IconData icon;
  final bool bordered;

  final String label;

  final FileSelectorItemType type;
  final ImageSource? source;

  final void Function(List<File>) onChanged;

  @override
  Widget build(BuildContext context) {
    return FileSelectorItem(
        icon: icon,
        child: type == FileSelectorItemType.image
            ? ImageImport(
                source: source ?? ImageSource.gallery,
                onChanged: (List<XFile> files) =>
                    onChanged(onFileChanged(files.map((e) => e.path).toList())),
                child: Text(label),
              )
            : FileImport(
                onChanged: (List<PlatformFile> files) =>
                    onChanged(onFileChanged(files.map((e) => e.path).toList())),
                child: Text(label),
              ));
  }
}
