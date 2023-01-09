import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../style.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage(
      {Key? key, this.avatar, this.radius = 50, this.borderWidth = 2})
      : super(key: key);

  final String? avatar;
  final double radius;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    bool hasAvatar = avatar != null && avatar!.isNotEmpty;

    return Container(
      decoration: BoxDecoration(
          border: Border.fromBorderSide(
              BorderSide(color: AppStyle.secondaryColor, width: borderWidth)),
          borderRadius: AppStyle.roundedCircle),
      child: CircleAvatar(
        radius: radius,
        backgroundImage: !hasAvatar ? null : NetworkImage(avatar!),
        backgroundColor: hasAvatar ? null : Colors.white,
        child: !hasAvatar ? FaIcon(FontAwesomeIcons.lightUser, size: radius * .5,) : null,
      ),
    );
  }
}
