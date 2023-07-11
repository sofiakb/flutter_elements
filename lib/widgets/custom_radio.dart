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
        Wrap(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          spacing: 10,
          alignment: WrapAlignment.spaceAround,
          children: widget.items
              .map<Widget>((e) => _radioItem(e.label, e.value))
              .toList(),
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

  Widget _radioItem(String label, T value) => Column(
        children: [
          if (widget.reverseLabels == false) Text(label),
          Radio<T>(
            value: value,
            groupValue: widget.selected,
            onChanged: widget.onChanged,
          ),
          if (widget.reverseLabels == true) Text(label),
        ],
      );
}

class CustomRadioButtonsValue<T> {
  final String label;
  final T value;

  const CustomRadioButtonsValue({required this.label, required this.value});
}
