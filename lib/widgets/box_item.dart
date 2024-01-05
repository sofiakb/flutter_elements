import 'package:flutter/material.dart';

import '../style.dart';

class BoxItem extends StatelessWidget {
  const BoxItem({super.key, required this.child, this.backgroundColor = Colors.white});

  final Widget child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: AppStyle.rounded,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 10,
              spreadRadius: 10),
        ],
      ),
      child: child
    );
  }
}
