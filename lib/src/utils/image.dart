import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';

Image imageFromBase64String(String base64String) =>
    Image.memory(base64Decode(base64String));

Uint8List dataFromBase64String(String base64String) =>
    base64Decode(base64String);

String base64String(Uint8List data) => base64Encode(data);
