import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/inherited/app_text_style.dart';

class MainContentTabBar extends StatelessWidget {
  const MainContentTabBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      dividerHeight: 0,
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      indicatorColor: AppColors.of(context).bs.brand,
      labelStyle: AppTextStyle.of(context).textBody3,
      labelColor: AppColors.of(context).text.brand,
      unselectedLabelColor: AppColors.of(context).text.secondary,
      unselectedLabelStyle: AppTextStyle.of(context).textBody3,
      labelPadding: EdgeInsets.symmetric(
        horizontal: AppNumbers.of(context).spacings.x3,
        vertical: AppNumbers.of(context).spacings.x2,
      ),
      tabs: const [
        Text("Мои проекты"),
        Text("Общие проекты"),
        Text("Приглашения"),
        Text("История"),
        Text("Репорты"),
      ],
    );
  }
}
