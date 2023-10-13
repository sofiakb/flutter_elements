import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ImageImport extends StatefulWidget {
  final Widget child;
  final ImageSource source;

  final String? title;

  final int maxFiles;

  final bool video;
  final bool media;

  final void Function(List<XFile>)? onChanged;

  const ImageImport(
      {Key? key,
      required this.child,
      this.title = "Choisir une image",
      this.source = ImageSource.gallery,
      this.maxFiles = 1,
      this.video = false,
      this.media = false,
      this.onChanged})
      : /*assert((fileType == FileType.custom && allowedExtensions == null) ||
            fileType != FileType.custom),*/
        super(key: key);

  @override
  State<ImageImport> createState() => _ImageImportState();
}

class _ImageImportState extends State<ImageImport> {
  final List<XFile> _selectedFiles = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => chooseImages(context),
      child: widget.child,
    );
  }

  bool get isMultiFiles => widget.maxFiles > 1;

  bool get hasMultiFiles => _selectedFiles.length > 1;

  bool get checkSelection =>
      _selectedFiles.length < widget.maxFiles || widget.maxFiles == 0;

  Future<void> chooseImages(BuildContext context) async {
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

    List<XFile> result = (widget.video
            ? [await ImagePicker().pickVideo(source: widget.source)]
            : widget.media
                ? isMultiFiles
                    ? await ImagePicker().pickMultipleMedia()
                    : [await ImagePicker().pickMedia()]
                : isMultiFiles
                    ? await ImagePicker().pickMultiImage()
                    : [await ImagePicker().pickImage(source: widget.source)])
        .whereType<XFile>()
        .toList();

    if (result.isNotEmpty) {
      for (int i = 0; i < result.length; i++) {
        if (_selectedFiles.length > widget.maxFiles - 1) {
          showSnackBar(
              "Vous ne pouvez sélectionner que ${Intl.plural(widget.maxFiles, other: "fichiers", one: "fichier")}");
          break;
        } else if (!_selectedFiles
            .every((file) => file.path != result[i].path)) {
          showSnackBar("Un fichier avec le même nom existe déjà");
        } else {
          setState(() => _selectedFiles.add(result[i]));
          // _selectedFiles.notifyListeners();
        }
      }
      if (widget.onChanged != null) widget.onChanged!(_selectedFiles);
    }
  }
}
