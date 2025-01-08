import 'package:flutter/material.dart';

class InfiniteScrollList<T> extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final VoidCallback onFetchMore;
  final bool isLoadingMore;
  final bool hasMore;

  const InfiniteScrollList({
    required this.itemCount,
    required this.itemBuilder,
    required this.onFetchMore,
    required this.isLoadingMore,
    required this.hasMore,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollEndNotification &&
            scrollNotification.metrics.extentAfter == 0 &&
            hasMore &&
            !isLoadingMore) {
          onFetchMore();
        }
        return false;
      },
      child: ListView.builder(
        itemCount: isLoadingMore ? itemCount + 1 : itemCount,
        itemBuilder: (context, index) {
          if (index == itemCount) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return itemBuilder(context, index);
        },
      ),
    );
  }
}
