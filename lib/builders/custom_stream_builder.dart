import 'package:flutter/material.dart';
import 'package:sofiakb_elements/widgets.dart';

class CustomStreamBuilder<T> extends StatelessWidget {
  const CustomStreamBuilder(
      {super.key,
      required this.stream,
      required this.builder,
      this.loader,
      this.defaultEmpty = true});

  final Stream<T> stream;
  final bool defaultEmpty;
  final Widget Function(
      BuildContext context, AsyncSnapshot snapshot, dynamic data) builder;

  final Widget? loader;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T?>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: loader ?? const CircularProgressIndicator());
          }

          if (snapshot.error != null) {
            debugPrint(snapshot.error.toString());
            debugPrintStack(stackTrace: snapshot.stackTrace, label: snapshot.error.toString());
            Future.delayed(
                const Duration(seconds: 1),
                () async => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const ErrorDialog();
                    }));
            return const SizedBox.shrink();
          }

          try {
            var dataArray = snapshot.data as List;
            if (defaultEmpty &&
                (snapshot.data == null || dataArray.isEmpty)) {
              return const NoData();
            }
          } catch (e) {
            if (defaultEmpty && snapshot.data == null) {
              return const NoData();
            }
          }

          return builder(context, snapshot, snapshot.data);
        });
  }
}
