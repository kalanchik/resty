import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/widgets/app_content_box/view/app_content_box.dart';
import 'package:postmanovich/core/widgets/window_title_bar/view/window_title_bar.dart';
import 'package:postmanovich/features/main/widget/main_layout/view/main_layout.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: AppNumbers.of(context).spacings.x2,
        children: [
          const WindowTitleBar(
            child: Row(
              children: [],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppNumbers.of(context).spacings.x3,
              ).copyWith(
                bottom: AppNumbers.of(context).spacings.x3,
              ),
              child: const AppContentBox(
                child: MainLayout(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
