import 'package:flutter/material.dart';
import 'package:sofiakb_elements/widgets.dart';

class Logo extends StatelessWidget {
  const Logo(
      {Key? key,
      this.path,
      this.fit = BoxFit.fitWidth,
      this.height = 150,
      this.width})
      : super(key: key);

  final String? path;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return XAssetImage(
      path ?? "logo.png",
      height: height,
      width: width,
    );
  }
}
