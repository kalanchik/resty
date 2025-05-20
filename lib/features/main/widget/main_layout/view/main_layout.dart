import 'package:flutter/material.dart';
import 'package:postmanovich/features/main/widget/main_content/view/main_content.dart';
import 'package:postmanovich/features/main/widget/main_layout/widget/main_content_box.dart';
import 'package:postmanovich/features/main/widget/main_layout/widget/main_menu_box.dart';
import 'package:postmanovich/features/main/widget/main_menu_content/view/main_menu_content.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        MainMenuBox(
          child: MainMenuContent(),
        ),
        MainContentBox(
          child: MainContent(),
        ),
      ],
    );
  }
}
