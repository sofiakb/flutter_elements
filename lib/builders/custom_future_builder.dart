import 'package:flutter/material.dart';
import 'package:sofiakb_elements/widgets.dart';

class CustomFutureBuilder<T> extends StatelessWidget {
  const CustomFutureBuilder(
      {Key? key,
      required this.future,
      required this.builder,
      this.loader,
      this.defaultEmpty = true,
      this.withErrorDialog = true,
      this.defaultError = true,
      this.useSnapshotErrorMessage = false,
      this.errorMessage,
      this.defaultEmptyMessage})
      : super(key: key);

  final Future<T> future;
  final bool defaultEmpty;
  final String? defaultEmptyMessage;
  final bool defaultError;
  final String? errorMessage;
  final bool withErrorDialog;
  final bool useSnapshotErrorMessage;
  final Widget Function(
      BuildContext context, AsyncSnapshot snapshot, dynamic data) builder;

  final Widget? loader;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T?>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: loader ?? const CircularProgressIndicator());
          }

          if (snapshot.error != null && withErrorDialog) {
            print(snapshot.error);
            print(snapshot.stackTrace);
            Future.delayed(
                Duration(seconds: 1),
                () async => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return defaultError ? ErrorDialog() : ErrorDialog(text: useSnapshotErrorMessage ? snapshot.error : errorMessage);
                    }));
            return SizedBox.shrink();
          }

          try {
            var dataArray = snapshot.data as List;
            if (defaultEmpty &&
                (snapshot.data == null || dataArray.isEmpty)) {
              return NoData(text: defaultEmptyMessage);
            }
          } catch (e) {
            if (defaultEmpty && snapshot.data == null) {
              return NoData(text: defaultEmptyMessage);
            }
          }

          return builder(context, snapshot, snapshot.data);
        });
  }
}
