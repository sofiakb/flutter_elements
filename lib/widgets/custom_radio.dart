import 'package:flutter/material.dart';
import 'package:sofiakb_elements/style.dart';

class CustomRadioButtons<T> extends StatefulWidget {
  const CustomRadioButtons(
      {Key? key,
      required this.selected,
      required this.onChanged,
      this.title,
      this.reverseLabels = false,
      required this.items})
      : super(key: key);

  final T? selected;
  final void Function(T? value) onChanged;

  final List<CustomRadioButtonsValue<T>> items;

  final String? title;
  final bool? reverseLabels;

  @override
  State<CustomRadioButtons<T>> createState() => _CustomRadioButtonsState<T>();
}

class _CustomRadioButtonsState<T> extends State<CustomRadioButtons<T>> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.title != null) _title(),
        Container(
          child: Wrap(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            spacing: 10,
            alignment: WrapAlignment.spaceAround,
            children: widget.items
                .map<Widget>((e) => _radioItem(e.value, label: e.label, child: e.child))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _title() => Padding(
        padding: AppStyle.paddingVertical(2),
        child: Text(
          widget.title!,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      );

  Widget _radioItem(T value, {String? label, Widget? child}) => Column(
        children: [
          if (widget.reverseLabels == false) label != null ? Text(label) : child!,
          Radio<T>(
            value: value,
            groupValue: widget.selected,
            onChanged: widget.onChanged,
          ),
          if (widget.reverseLabels == true) label != null ? Text(label) : child!,
        ],
      );
}

class CustomRadioButtonsValue<T> {
  final String? label;
  final Widget? child;
  final T value;

  const CustomRadioButtonsValue({this.label, required this.value, this.child})
      : assert(
          label != null || child != null,
          'label or child must be provided',
        ),
        assert(
          label == null || child == null,
          'Cannot provide both a label and a child',
        );
}
