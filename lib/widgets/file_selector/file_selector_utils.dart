import 'dart:io';

import 'package:flutter/material.dart';

const BorderRadius borderRadius = BorderRadius.all(Radius.circular(12.0));
const EdgeInsetsGeometry padding =
    EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0);

const Color textColor = Color(0xFF006EE6);

List<File> onFileChanged(List<String?> paths) =>
    paths.whereType<String>().map((e) => File(e)).toList();
