import 'dart:io';

import 'package:file_picker/file_picker.dart' as file;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart' as image;
import 'package:intl/intl.dart';

import 'configuration/camera_file_selector_configuration.dart';
import 'configuration/files_file_selector_configuration.dart';
import 'configuration/gallery_file_selector_configuration.dart';
import 'file_import.dart';
import 'image_import.dart';

const BorderRadius borderRadius = BorderRadius.all(Radius.circular(12.0));
const EdgeInsetsGeometry padding =
    EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0);

const Color textColor = Color(0xFF006EE6);

class FileSelector extends StatefulWidget {
  const FileSelector({
    super.key,
    this.onChanged,
    this.child,
    this.children,
    this.autoOpen = false,
    this.maxFiles,
    this.cameraConfiguration = const CameraFileSelectorConfiguration(),
    this.galleryConfiguration = const GalleryFileSelectorConfiguration(),
    this.filesConfiguration = const FilesFileSelectorConfiguration(),
  });

  final void Function(List<File>)? onChanged;

  final Widget? child;
  final List<Widget>? children;
  final bool autoOpen;

  final CameraFileSelectorConfiguration cameraConfiguration;
  final GalleryFileSelectorConfiguration galleryConfiguration;
  final FilesFileSelectorConfiguration filesConfiguration;

  final int? maxFiles;

  @override
  State<FileSelector> createState() => _FileSelectorState();
}

class _FileSelectorState extends State<FileSelector> {
  final Color backgroundColor = Colors.white;

  final ValueNotifier<List<File>> _files = ValueNotifier([]);

  @override
  void dispose() {
    _files.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.autoOpen) {
      Future.delayed(Duration.zero, () => showBottomSelectors(context));
    }

    return GestureDetector(
        onTap: () => showBottomSelectors(context),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ValueListenableBuilder(
              valueListenable: _files,
              builder: (context, value, child) {
                return SizedBox(
                  width: double.infinity,
                  child: widget.child ??
                      Text(
                        _files.value.isEmpty
                            ? "Choisir ${Intl.plural(widget.maxFiles ?? 1, other: "des fichiers", one: "un fichier")}..."
                            : _files.value.length == 1
                                ? _fileName(_files.value.first.path)
                                : "${_files.value.length} fichiers",
                      ),
                );
              }),
        ));
  }

  bool get withCamera => widget.cameraConfiguration.enabled;

  bool get withGallery => widget.galleryConfiguration.enabled;

  bool get withFiles => widget.filesConfiguration.enabled;

  _onChanged(List<String?> filePaths) {
    _files.value = filePaths
        .map((e) => e == null ? null : File(e))
        .whereType<File>()
        .toList();
    Navigator.pop(context);
    widget.onChanged?.call(_files.value);
  }

  Future showBottomSelectors(BuildContext context) => showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: backgroundColor.withOpacity(.9),
                      borderRadius: borderRadius,
                    ),
                    child: Column(
                      children: widget.children ?? [
                        if (withCamera)
                          FileSelectorItem(
                              icon: widget.cameraConfiguration.icon,
                              child: ImageImport(
                                source: image.ImageSource.camera,
                                video: widget.cameraConfiguration.fileType == CameraFileType.video,
                                media: widget.cameraConfiguration.fileType == CameraFileType.media,
                                onChanged: (List<image.XFile> files) =>
                                    _onChanged(
                                        files.map((e) => e.path).toList()),
                                child: widget.cameraConfiguration.child ??
                                    Text(widget.cameraConfiguration.label!),
                              )),
                        if (withGallery)
                          FileSelectorItem(
                              icon: widget.galleryConfiguration.icon,
                              child: ImageImport(
                                source: image.ImageSource.gallery,
                                video: widget.galleryConfiguration.fileType == GalleryFileType.video,
                                media: widget.galleryConfiguration.fileType == GalleryFileType.media,
                                onChanged: (List<image.XFile> files) =>
                                    _onChanged(
                                        files.map((e) => e.path).toList()),
                                child: widget.galleryConfiguration.child ??
                                    Text(widget.galleryConfiguration.label!),
                              )),
                        if (withFiles)
                          FileSelectorItem(
                              bordered: false,
                              icon: widget.filesConfiguration.icon,
                              child: FileImport(
                                  onChanged: (List<file.PlatformFile> files) =>
                                      _onChanged(
                                          files.map((e) => e.path).toList()),
                                  child: widget.filesConfiguration.child ??
                                      Text(widget.filesConfiguration.label!))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: borderRadius, color: backgroundColor),
                      child: const Padding(
                        padding: padding,
                        child: Text("Annuler",
                            style: TextStyle(
                                color: textColor, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ));

  _fileName(String path) {
    return path.split('/').last;
  }
}

class FileSelectorItem extends StatelessWidget {
  const FileSelectorItem(
      {super.key,
      required this.icon,
      required this.child,
      this.bordered = true});

  final IconData icon;
  final Widget child;
  final bool bordered;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                  width: 25, child: FaIcon(icon, color: textColor, size: 18)),
              Expanded(child: child)
            ],
          ),
        ),
        if (bordered)
          Container(width: double.infinity, height: 1, color: Colors.grey),
      ],
    );
  }
}
