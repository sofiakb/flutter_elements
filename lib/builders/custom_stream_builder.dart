import 'package:flutter/material.dart';
import 'package:sofiakb_elements/widgets.dart';

class CustomStreamBuilder<T> extends StatelessWidget {
  const CustomStreamBuilder(
      {Key? key,
      required this.stream,
      required this.builder,
      this.loader,
      this.defaultEmpty = true})
      : super(key: key);

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
            print(snapshot.error);
            print(snapshot.stackTrace);
            Future.delayed(
                Duration(seconds: 1),
                () async => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ErrorDialog();
                    }));
            return SizedBox.shrink();
          }

          try {
            var dataArray = snapshot.data as List;
            if (defaultEmpty &&
                (snapshot.data == null || dataArray.isEmpty)) {
              return NoData();
            }
          } catch (e) {
            if (defaultEmpty && snapshot.data == null) {
              return NoData();
            }
          }

          return builder(context, snapshot, snapshot.data);
        });
  }
}
