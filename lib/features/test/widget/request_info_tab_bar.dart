import 'package:flutter/material.dart';

class RequestInfoTabBar extends StatelessWidget {
  const RequestInfoTabBar({
    super.key,
    required this.controller,
    required this.onPageChanged,
  });

  final ValueChanged<int> onPageChanged;
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onPageChanged,
      controller: controller,
      indicatorSize: TabBarIndicatorSize.tab,
      tabs: const [
        Tab(text: "PARAMS"),
        Tab(text: "HEADERS"),
        Tab(text: "DATA"),
      ],
    );
  }
}
