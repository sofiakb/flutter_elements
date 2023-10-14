import 'package:flutter/cupertino.dart';

import 'file_selector_configuration.dart';

class GalleryFileSelectorConfiguration extends FileSelectorConfiguration {
  const GalleryFileSelectorConfiguration(
      {super.enabled,
      super.onChanged,
      super.label = "Bibliothèque",
      super.icon = CupertinoIcons.photo,
      super.child,
      this.fileType = GalleryFileType.image});

  final GalleryFileType fileType;
}

enum GalleryFileType { video, image, media }
