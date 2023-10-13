import 'package:flutter/cupertino.dart';

import 'file_selector_configuration.dart';

class FilesFileSelectorConfiguration extends FileSelectorConfiguration {
  const FilesFileSelectorConfiguration(
      {super.enabled,
      super.onChanged,
      super.label = "Fichiers",
      super.icon = CupertinoIcons.folder,
      super.child});
}
