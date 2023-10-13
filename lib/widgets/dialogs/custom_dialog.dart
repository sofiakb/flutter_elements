import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sofiakb_elements/logic/custom_dialog/custom_dialog_icon.dart';
import 'package:sofiakb_elements/logic/custom_dialog/custom_dialog_icons_type.dart';
import 'package:sofiakb_elements/style.dart';

class CustomDialogBox extends StatefulWidget {
  final String? title;

  final String text;

  final String? confirmButtonText;
  final bool showConfirmButton;

  final String? cancelButtonText;
  final bool showCancelButton;

  final Image? img;
  final CustomDialogIconsType? icon;

  const CustomDialogBox(
      {Key? key,
      required this.text,
      this.title,
      this.confirmButtonText = "Confirmer",
      this.showConfirmButton = true,
      this.cancelButtonText = "Annuler",
      this.showCancelButton = true,
      this.icon,
      this.img})
      : super(key: key);

  @override
  State<CustomDialogBox> createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  late CustomDialogIcon? customDialogIcon;

  @override
  void initState() {
    if (widget.icon != null) {
      customDialogIcon = CustomDialogIcon.fromIconType(widget.icon!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: AppStyle.rounded,
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    double iconSize = 60;
    return Stack(
      children: <Widget>[
        Container(
          padding:
              AppStyle.padding(top: 6.0, right: 2.0, bottom: 2.0, left: 2.0),
          margin: EdgeInsets.only(top: iconSize / 2),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: AppStyle.rounded,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (widget.title != null || customDialogIcon?.title != null)
                Text(
                  (widget.title ?? customDialogIcon?.title)!,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
              SizedBox(
                height: 15,
              ),
              Text(
                widget.text,
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.showConfirmButton &&
                      widget.confirmButtonText != null)
                    DialogButton(
                      onPressed: () => confirm(context),
                      backgroundColor: customDialogIcon?.color,
                      text: widget.confirmButtonText!,
                    ),
                  if (widget.showConfirmButton || widget.showCancelButton)
                    SizedBox(
                      width: 10,
                    ),
                  if (widget.showCancelButton &&
                      widget.cancelButtonText != null)
                    DialogButton(
                        onPressed: () => cancel(context),
                        backgroundColor: Colors.grey,
                        text: widget.cancelButtonText!)
                  /*TextButton(
                        onPressed: () => confirm(context),
                        style: TextButton.styleFrom(
                            padding: AppStyle.paddingAll(3),
                            backgroundColor: Colors.grey,
                            foregroundColor: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(25),
                          child: Text(
                            widget.cancelButtonText!,
                            style: TextStyle(fontSize: 18),
                          ),
                        )),*/
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: (iconSize / 2) - 5,
          right: 5,
          child: Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              onPressed: () => cancel(context),
              icon: FaIcon(
                FontAwesomeIcons.lightXmark,
                size: 20,
                color: Colors.grey.shade300,
              ),
            ),
          ),
        ),
        if (widget.icon != null && customDialogIcon != null)
          Positioned(
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: AppStyle.roundedCircle,
                child: SizedBox.fromSize(
                  size: Size(iconSize, iconSize),
                  child: Container(
                    color: customDialogIcon!.color,
                    child: Padding(
                      padding: AppStyle.paddingAll(2),
                      child: Align(
                        alignment: Alignment.center,
                        child: FaIcon(
                          customDialogIcon!.icon,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  void close(BuildContext context, {String? message}) => Navigator.of(context).pop(message);

  void cancel(BuildContext context) => close(context, message: 'cancel');

  void confirm(BuildContext context) => close(context, message: 'confirm');
}

class DialogButton extends StatelessWidget {
  const DialogButton(
      {Key? key,
      required this.onPressed,
      this.backgroundColor,
      required this.text})
      : super(key: key);

  final void Function() onPressed;
  final Color? backgroundColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => onPressed(),
        style: TextButton.styleFrom(
            padding: AppStyle.padding(top: 1, bottom: 1, left: 2, right: 2),
            backgroundColor: backgroundColor,
            foregroundColor: Colors.white),
        child: Text(
          text,
          style: TextStyle(fontSize: 18),
        ));
  }
}
