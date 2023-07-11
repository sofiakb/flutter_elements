import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sofiakb_elements/style.dart';

class CustomRadioButtons<T> extends StatefulWidget {
  const CustomRadioButtons({
    Key? key,
    required this.selected,
    required this.onChanged,
    required this.items,
    this.title,
    this.reverseLabels = false,
    this.perLines = 3,
    this.minWidth,
    this.spacing,
    this.textOverflow,
  }) : super(key: key);

  final T? selected;
  final void Function(T? value) onChanged;

  final List<CustomRadioButtonsValue<T>> items;

  final String? title;
  final bool? reverseLabels;
  final double perLines;
  final double? minWidth;
  final double? spacing;

  final TextOverflow? textOverflow;

  @override
  State<CustomRadioButtons<T>> createState() => _CustomRadioButtonsState<T>();
}

class _CustomRadioButtonsState<T> extends State<CustomRadioButtons<T>> {
  final GlobalKey _globalKey = GlobalKey();
  final ValueNotifier<double> _parentWidth = ValueNotifier(0);

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _parentWidth.value = _globalKey.currentContext?.size?.width ??
          MediaQuery.of(context).size.width;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: _globalKey,
      width: double.infinity,
      child: Column(
        children: [
          if (widget.title != null) _title(),
          Center(
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              children: widget.items
                  .map<Widget>((e) => Builder(builder: (context) {
                        return ValueListenableBuilder(
                            valueListenable: _parentWidth,
                            builder: (context, value, child) {
                              return SizedBox(
                                  width: max(widget.minWidth ?? 0,
                                      _parentWidth.value / widget.perLines),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: (widget.spacing ?? 0) / 2),
                                    child: _radioItem(e.value,
                                        label: e.label, child: e.child),
                                  ));
                            });
                      }))
                  .toList(),
            ),
          )
        ],
      ),
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
          if (widget.reverseLabels == false)
            label != null
                ? Text(label, softWrap: true, overflow: widget.textOverflow)
                : child!,
          Radio<T>(
            value: value,
            groupValue: widget.selected,
            onChanged: widget.onChanged,
          ),
          if (widget.reverseLabels == true)
            label != null
                ? Text(label, softWrap: true, overflow: widget.textOverflow)
                : child!,
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
