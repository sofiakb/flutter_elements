import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sofiakb_elements/src/utils/images.dart';
import 'package:sofiakb_elements/style.dart';

class NoData extends StatelessWidget {
  const NoData(
      {Key? key,
      this.path,
      this.text = "Oups ! Aucun résultat trouvé",
      this.subtext,
      this.fit = BoxFit.contain,
      this.height = 150,
      this.width})
      : super(key: key);

  final String? path;
  final String? text;
  final String? subtext;

  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.memory(
          base64Decode(noDataPng),
          // package: path == null ? "elements" : null,
          width: width,
          height: height,
          fit: fit,
        ),
        /*Image.asset(
          path ?? "assets/img/no-data.png",
          // package: path == null ? "elements" : null,
          width: width,
          height: height,
          fit: fit,
        ),*/
        Padding(
          padding: AppStyle.padding(top: 2, bottom: 1),
          child: Text(
            text ?? "Oups ! Aucun résultat trouvé",
            style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontSize:
                    (Theme.of(context).textTheme.bodyText1?.fontSize ?? 14) *
                        1.2),
          ),
        ),
        if (subtext != null)
          Text(
            subtext!,
          )
      ],
    );
  }
}
