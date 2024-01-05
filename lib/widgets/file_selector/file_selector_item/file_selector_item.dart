import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../file_selector_utils.dart';

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