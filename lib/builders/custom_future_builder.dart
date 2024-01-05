import 'package:flutter/material.dart';
import 'package:sofiakb_elements/widgets.dart';

class CustomFutureBuilder<T> extends StatelessWidget {
  const CustomFutureBuilder(
      {super.key,
      required this.future,
      required this.builder,
      this.loader,
      this.defaultEmpty = true,
      this.withErrorDialog = true,
      this.defaultError = true,
      this.useSnapshotErrorMessage = false,
      this.errorMessage,
      this.defaultEmptyMessage});

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
            debugPrint(snapshot.error.toString());
            debugPrintStack(stackTrace: snapshot.stackTrace, label: snapshot.error.toString());
            Future.delayed(
                const Duration(seconds: 1),
                () async => showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        defaultError && !useSnapshotErrorMessage
                            ? const ErrorDialog()
                            : ErrorDialog(
                                text: useSnapshotErrorMessage
                                    ? snapshot.error.toString()
                                    : errorMessage ?? "Une erreur est survenue, merci de réessayer plus tard.")));
            return const SizedBox.shrink();
          }

          try {
            var dataArray = snapshot.data as List;
            if (defaultEmpty && (snapshot.data == null || dataArray.isEmpty)) {
              return NoData(
                  text: useSnapshotErrorMessage
                      ? snapshot.error.toString()
                      : errorMessage ?? defaultEmptyMessage);
            }
          } catch (e) {
            if (defaultEmpty && snapshot.data == null) {
              return NoData(
                  text: useSnapshotErrorMessage
                      ? snapshot.error.toString()
                      : errorMessage ?? defaultEmptyMessage);
            }
          }

          return builder(context, snapshot, snapshot.data);
        });
  }
}
