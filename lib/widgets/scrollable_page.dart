import 'package:flutter/material.dart';

class ScrollablePage extends StatelessWidget {
  const ScrollablePage(
      {super.key,
      this.children,
      this.child,
      this.resizeToAvoidBottomInset = false});

  final Widget? child;
  final List<Widget>? children;

  final bool resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minWidth: constraints.maxWidth,
                      minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: (children ?? [child!])))));
        }),
      ),
      // resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    );
  }
}
