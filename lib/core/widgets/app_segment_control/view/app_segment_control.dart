import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/inherited/app_text_style.dart';
import 'package:postmanovich/core/widgets/app_segment_control/entity/segment_control_size.dart';

class AppSegmentControl extends StatelessWidget {
  const AppSegmentControl({
    super.key,
    this.onLayer = false,
    this.size = const SegmentControlSizeXS(),
    this.onTap,
    required this.tabs,
    required this.tabController,
  });

  final bool onLayer;
  final SegmentControlSize size;
  final TabController tabController;
  final List<String> tabs;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    final style = textStyle(context);
    final boxPadding = padding(context);

    return SizedBox(
      height: size.height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: onLayer
              ? AppColors.of(context).input.fillLayer
              : AppColors.of(context).input.fill,
          borderRadius: BorderRadius.all(
            Radius.circular(
              AppNumbers.of(context).brRadius.s,
            ),
          ),
        ),
        child: TabBar(
          dividerHeight: 0,
          onTap: onTap,
          indicatorSize: TabBarIndicatorSize.tab,
          padding: boxPadding,
          indicator: BoxDecoration(
            color: AppColors.of(context).tab.active,
            borderRadius: BorderRadius.all(
              Radius.circular(
                AppNumbers.of(context).brRadius.xs2,
              ),
            ),
          ),
          labelStyle: style,
          labelColor: AppColors.of(context).text.primary,
          unselectedLabelStyle: style,
          unselectedLabelColor: AppColors.of(context).text.secondary,
          controller: tabController,
          tabs: tabs
              .map((e) => Tab(
                    text: e,
                  ))
              .toList(),
        ),
      ),
    );
  }

  TextStyle textStyle(BuildContext context) {
    switch (size) {
      case SegmentControlSizeXS():
      case SegmentControlSizeS():
        return AppTextStyle.of(context).textBody3;

      default:
        return AppTextStyle.of(context).textBody2;
    }
  }

  EdgeInsetsGeometry padding(BuildContext context) {
    switch (size) {
      case SegmentControlSizeXS():
      case SegmentControlSizeS():
      case SegmentControlSizeM():
        return EdgeInsets.symmetric(
          horizontal: AppNumbers.of(context).spacings.x_5,
          vertical: AppNumbers.of(context).spacings.x_5,
        );

      default:
        return EdgeInsets.symmetric(
          horizontal: AppNumbers.of(context).spacings.x1,
          vertical: AppNumbers.of(context).spacings.x1,
        );
    }
  }
}
