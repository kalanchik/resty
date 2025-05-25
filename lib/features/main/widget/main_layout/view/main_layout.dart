import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/domain/use_case/project_use_case/project_use_case.dart';
import 'package:postmanovich/features/main/blocs/my_projects/bloc/my_projects_bloc.dart';
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
    return Row(
      children: [
        const MainMenuBox(
          child: MainMenuContent(),
        ),
        MainContentBox(
          child: BlocProvider(
            create: (context) => MyProjectsBloc(context.read<ProjectUseCase>())
              ..add(
                FetchMyProjectsEvent(),
              ),
            lazy: false,
            child: const MainContent(),
          ),
        ),
      ],
    );
  }
}
