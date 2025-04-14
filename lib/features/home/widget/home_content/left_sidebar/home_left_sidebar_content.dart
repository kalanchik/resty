import 'package:flutter/cupertino.dart';
import 'package:postmanovich/features/home/widget/home_content/left_sidebar/home_left_side_bar_menu/home_left_sidebar_menu.dart';

class HomeLeftSidebarContent extends StatelessWidget {
  const HomeLeftSidebarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          HomeLeftSidebarMenu(),
        ],
      ),
    );
  }
}
