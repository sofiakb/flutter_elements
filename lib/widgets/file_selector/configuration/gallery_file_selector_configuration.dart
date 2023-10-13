import 'package:flutter/cupertino.dart';

import 'file_selector_configuration.dart';

class GalleryFileSelectorConfiguration extends FileSelectorConfiguration {
  const GalleryFileSelectorConfiguration(
      {super.enabled,
      super.onChanged,
      super.label = "Bibliothèque",
      super.icon = CupertinoIcons.photo,
      super.child});
}
