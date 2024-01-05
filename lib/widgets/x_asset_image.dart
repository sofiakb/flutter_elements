import 'package:flutter/material.dart';

class XAssetImage extends StatelessWidget {
  const XAssetImage(this.path, {super.key, this.width, this.height, this.fit});

  final String path;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/$path",
      width: width,
      height: height,
      fit: fit,
    );
  }
}
