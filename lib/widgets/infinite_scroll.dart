import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class InfiniteScroll extends StatefulWidget {
  const InfiniteScroll({super.key, required this.child, required this.onRefresh});

  final Widget child;

  final Future Function() onRefresh;

  @override
  State<InfiniteScroll> createState() => _InfiniteScrollState();
}

class _InfiniteScrollState extends State<InfiniteScroll> {
  final ScrollController _scrollController = ScrollController();

  bool _isLoading = false;

  @override
  void initState() {
    _scrollController.addListener(() async {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      double delta = MediaQuery.of(context).size.width * .20;
      if (maxScroll - currentScroll <= delta &&
          !_isLoading &&
          _scrollController.position.userScrollDirection ==
              ScrollDirection.reverse) {
        setState(() => _isLoading = true);
        await widget.onRefresh();
        Future.delayed(const Duration(seconds: 1), () => setState(() => _isLoading = false))
        ;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [widget.child],
    );
  }
}
