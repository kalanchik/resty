import 'package:flutter/widgets.dart';
import 'package:postmanovich/core/inherited/app_assets.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/features/project/widget/project_menu/widget/project_menu_item.dart';

class ProjectMenu extends StatelessWidget {
  const ProjectMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 85,
      height: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppNumbers.of(context).spacings.x6,
        ),
        child: Column(
          spacing: AppNumbers.of(context).spacings.x3,
          children: [
            ProjectMenuItem(
              onTap: () {},
              isActive: false,
              title: "Проект",
              iconPath: AppAssets.of(context).folderMenu,
            ),
            ProjectMenuItem(
              onTap: () {},
              isActive: false,
              title: "API",
              iconPath: AppAssets.of(context).commentAlt,
            ),
            ProjectMenuItem(
              onTap: () {},
              isActive: false,
              title: "Вики",
              iconPath: AppAssets.of(context).document,
            ),
            ProjectMenuItem(
              onTap: () {},
              isActive: false,
              title: "История",
              iconPath: AppAssets.of(context).clock,
            ),
            ProjectMenuItem(
              onTap: () {},
              isActive: false,
              title: "Настройки",
              iconPath: AppAssets.of(context).settingsSlider,
            ),
          ],
        ),
      ),
    );
  }
}
