import 'package:flutter/material.dart';
import 'package:postmanovich/features/test/widget/project_menu/project_menu_button/project_menu_button.dart';

class ProjectMenu extends StatelessWidget {
  const ProjectMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8.0,
        children: [
          ProjectMenuButton(
            onTap: () {},
            icon: const Icon(
              Icons.home,
            ),
            title: "Home",
          ),
          ProjectMenuButton(
            onTap: () {},
            icon: const Icon(
              Icons.api,
            ),
            title: "Api",
          ),
          ProjectMenuButton(
            onTap: () {},
            icon: const Icon(
              Icons.assignment_outlined,
            ),
            title: "Env",
          ),
        ],
      ),
    );
  }
}
