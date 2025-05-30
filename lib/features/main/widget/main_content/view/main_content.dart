import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/core/inherited/app_assets.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/widgets/app_elevated_button/entity/app_button_size.dart';
import 'package:postmanovich/core/widgets/app_elevated_button/entity/app_button_style.dart';
import 'package:postmanovich/core/widgets/app_elevated_button/entity/app_button_type.dart';
import 'package:postmanovich/core/widgets/app_elevated_button/view/app_elevated_button.dart';
import 'package:postmanovich/core/widgets/app_icon/app_icon.dart';
import 'package:postmanovich/core/widgets/project_item/view/project_item.dart';
import 'package:postmanovich/features/main/blocs/my_projects/bloc/my_projects_bloc.dart';
import 'package:postmanovich/features/main/widget/main_content/widget/main_content_tab_bar.dart';
import 'package:postmanovich/features/main/widget/main_content/widget/main_header.dart';
import 'package:postmanovich/features/project_create/view/project_create_modal.dart';

class MainContent extends StatefulWidget {
  const MainContent({
    super.key,
  });

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 5,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainHeader(),
        SizedBox(
          height: AppNumbers.of(context).spacings.x8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MainContentTabBar(
              tabController: _tabController,
            ),
            Row(
              spacing: AppNumbers.of(context).spacings.x2,
              children: [
                AppElevatedButton(
                  onTap: () {},
                  style: const ElevatedButtonStyle(
                    size: AppButtonSizeS(),
                    type: AppButtonGhostType(),
                  ),
                  icon: AppIcon(
                    icon: AppAssets.of(context).code,
                  ),
                  child: const Text("Импорт"),
                ),
                AppElevatedButton(
                  onTap: () => showDialog(
                    context: context,
                    builder: (_) => const ProjectCreateModal(),
                  ),
                  style: const ElevatedButtonStyle(
                    size: AppButtonSizeS(),
                    type: AppButtonBrandType(),
                  ),
                  icon: AppIcon(
                    icon: AppAssets.of(context).folder,
                  ),
                  child: const Text("Создать"),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: AppNumbers.of(context).spacings.x4,
        ),
        Expanded(
          child: BlocBuilder<MyProjectsBloc, MyProjectsState>(
            bloc: context.read<MyProjectsBloc>(),
            builder: (context, state) {
              if (state is MyProjectLoaded) {
                return ListView(
                  shrinkWrap: true,
                  children: [
                    Wrap(
                      children: state.projects
                          .map((e) => ProjectItem(
                                onTap: () {},
                                project: e,
                              ))
                          .toList(),
                    )
                  ],
                );
              }

              if (state is MyProjectError) {
                return const Center(
                  child: Text("Ошибка при получении проектов"),
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        )
      ],
    );
  }
}
