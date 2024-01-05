import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const List<String> defaultAllowedExtensions = ['jpg', 'png', 'pdf'];

class FileImport extends StatefulWidget {
  final Widget child;
  final FileType fileType;

  final String? title;

  final int maxFiles;

  final List<String>? allowedExtensions;

  final void Function(List<PlatformFile>)? onChanged;

  const FileImport(
      {super.key,
      required this.child,
      this.title = "Choisir un fichier",
      this.fileType = FileType.custom,
      this.maxFiles = 1,
      this.allowedExtensions,
      this.onChanged})
      : assert((fileType == FileType.custom && allowedExtensions == null) ||
            fileType != FileType.custom);

  @override
  State<FileImport> createState() => _FileImportState();
}

class _FileImportState extends State<FileImport> {
  final List<PlatformFile> _selectedFiles = [];

  late List<String> _allowedExtensions;

  @override
  void initState() {
    _allowedExtensions = widget.allowedExtensions ?? defaultAllowedExtensions;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        chooseFiles(context);
      },
      child: widget.child,
    );
  }

  bool get isMultiFiles => widget.maxFiles > 1;

  bool get hasMultiFiles => _selectedFiles.length > 1;

  bool get checkSelection =>
      _selectedFiles.length < widget.maxFiles || widget.maxFiles == 0;

  bool get isCustom => widget.fileType == FileType.custom;

  Future<void> chooseFiles(BuildContext context) async {
    void showSnackBar(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
    }

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      dialogTitle: widget.title,
      type: widget.fileType,
      allowedExtensions: isCustom ? _allowedExtensions : null ,
      allowMultiple: isMultiFiles,
    );
    if (result != null) {
      for (int i = 0; i < result.files.length; i++) {
        if (_selectedFiles.length > widget.maxFiles - 1) {
          showSnackBar(
              "Vous ne pouvez sélectionner que ${Intl.plural(widget.maxFiles, other: "fichiers", one: "fichier")}");
          break;
        } else if (!_selectedFiles
            .every((file) => file.path != result.files[i].path)) {
          showSnackBar("Un fichier avec le même nom existe déjà");
        } else {
          setState(() => _selectedFiles.add(result.files[i]));
          // _selectedFiles.notifyListeners();
        }
      }
      if (widget.onChanged != null) widget.onChanged!(_selectedFiles);
    }
  }
}
