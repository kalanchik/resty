import 'package:flutter/material.dart';
import 'package:postmanovich/features/home/widget/home_bottom/home_bottom.dart';
import 'package:postmanovich/features/home/widget/home_content/home_content.dart';
import 'package:postmanovich/features/home/widget/home_header/home_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            HomeHeader(),
            HomeContent(),
            HomeBottom(),
          ],
        ),
      ),
    );
  }
}
