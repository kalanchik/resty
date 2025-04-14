import 'package:flutter/material.dart';
import 'package:postmanovich/features/home/widget/home_content/left_sidebar/home_left_side_bar.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            HomeLeftSideBar(),
          ],
        ),
      ),
    );
  }
}
