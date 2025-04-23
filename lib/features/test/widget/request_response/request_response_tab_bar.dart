import 'package:flutter/material.dart';

class RequestResponseTabBar extends StatelessWidget {
  const RequestResponseTabBar({
    super.key,
    required this.controller,
  });

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Colors.black26,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: SizedBox(
          width: 200,
          child: TabBar(
            controller: controller,
            dividerHeight: 0,
            tabs: const [
              Tab(text: "Body"),
              Tab(text: "Headers"),
            ],
          ),
        ),
      ),
    );
  }
}
