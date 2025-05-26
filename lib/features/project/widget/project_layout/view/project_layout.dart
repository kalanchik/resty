import 'package:flutter/widgets.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/features/project/widget/project_menu/view/project_menu.dart';
import 'package:postmanovich/features/project_api/view/project_api_screen.dart';

class ProjectLayout extends StatelessWidget {
  const ProjectLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppNumbers.of(context).spacings.x3,
      children: [
        ProjectMenu(),
        Expanded(
          child: ProjectApiScreen(),
        ),
      ],
    );
  }
}
