import 'package:file_picker/file_picker.dart' as file;
import 'package:flutter/material.dart';

class FileSelectorConfiguration {
  const FileSelectorConfiguration({
    this.enabled = true,
    this.onChanged,
    this.label,
    this.child,
    required this.icon,
  }) : assert(child != null || label != null);

  final bool enabled;
  final void Function(List<file.PlatformFile>)? onChanged;

  final String? label;
  final Widget? child;
  final IconData icon;
}