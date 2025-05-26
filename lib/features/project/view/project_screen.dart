import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/widgets/window_title_bar/view/window_title_bar.dart';
import 'package:postmanovich/features/project/widget/project_layout/view/project_layout.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({
    super.key,
    required this.projectId,
  });

  final String projectId;

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const WindowTitleBar(
            child: Row(),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(
                AppNumbers.of(context).spacings.x3,
              ),
              child: const ProjectLayout(),
            ),
          ),
        ],
      ),
    );
  }
}
