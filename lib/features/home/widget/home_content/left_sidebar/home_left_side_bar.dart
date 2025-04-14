import 'package:flutter/material.dart';
import 'package:postmanovich/features/home/widget/home_content/left_sidebar/home_left_sidebar_content.dart';
import 'package:postmanovich/features/home/widget/home_content/left_sidebar/home_work_space.dart';

class HomeLeftSideBar extends StatelessWidget {
  const HomeLeftSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: double.infinity,
      child: Column(
        children: [
          HomeWorkSpace(),
          HomeLeftSidebarContent(),
        ],
      ),
    );
  }
}
