import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sofiakb_elements/widgets/custom_radio.dart';

void main() {
  testWidgets('CustomRadioButtons reports the tapped value', (tester) async {
    String? selected = 'a';
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: StatefulBuilder(
          builder: (context, setState) => CustomRadioButtons<String>(
            selected: selected,
            onChanged: (value) => setState(() => selected = value),
            items: const [
              CustomRadioButtonsValue(label: 'A', value: 'a'),
              CustomRadioButtonsValue(label: 'B', value: 'b'),
            ],
          ),
        ),
      ),
    ));
    await tester.pumpAndSettle();

    await tester.tap(find.byType(Radio<String>).last);
    await tester.pumpAndSettle();

    expect(selected, 'b');
  });
}
