import 'package:flutter/cupertino.dart';

import 'file_selector_configuration.dart';

class CameraFileSelectorConfiguration extends FileSelectorConfiguration {
  const CameraFileSelectorConfiguration(
      {super.enabled,
      super.onChanged,
      super.label = "Caméra",
      super.icon = CupertinoIcons.camera,
      super.child});
}
