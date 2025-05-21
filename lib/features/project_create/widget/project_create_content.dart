import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/inherited/app_text_style.dart';
import 'package:postmanovich/core/widgets/app_form_control/view/app_form_control.dart';
import 'package:postmanovich/core/widgets/app_segment_control/entity/segment_control_size.dart';
import 'package:postmanovich/core/widgets/app_segment_control/view/app_segment_control.dart';
import 'package:postmanovich/core/widgets/app_text_input/entity/app_text_input_size.dart';

class ProjectCreateContent extends StatelessWidget {
  const ProjectCreateContent({
    super.key,
    required this.nameCtrl,
    required this.descriptionCtrl,
    required this.typeTabCtrl,
    required this.saveMethodTabCtrl,
    required this.typeIndexNotifier,
    required this.saveMethodIndexNotifier,
  });

  final TextEditingController nameCtrl;
  final TextEditingController descriptionCtrl;
  final TabController typeTabCtrl;
  final TabController saveMethodTabCtrl;
  final ValueNotifier<int> typeIndexNotifier;
  final ValueNotifier<int> saveMethodIndexNotifier;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppNumbers.of(context).spacings.x4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppNumbers.of(context).spacings.x2,
        children: [
          AppFormControl(
            title: "Название проекта",
            onLayer: true,
            size: const AppTextInputSizeL(),
            caption: null,
            controller: nameCtrl,
            hintText: "Resty API",
          ),
          AppFormControl(
            title: "Описание проекта",
            onLayer: true,
            size: const AppTextInputSizeL(),
            caption: null,
            controller: descriptionCtrl,
            hintText: "Краткое описание вашего проекта",
            maxLines: 4,
            minLines: 4,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppNumbers.of(context).spacings.x1,
            children: [
              Text(
                "Способ хранения",
                style: AppTextStyle.of(context).textBody3.copyWith(
                      color: AppColors.of(context).text.secondary,
                    ),
              ),
              AppSegmentControl(
                tabs: const ["Cloud", "Local", "GitHub", "GitLab"],
                tabController: saveMethodTabCtrl,
                onLayer: true,
                size: const SegmentControlSizeS(),
                onTap: (newIndex) => saveMethodIndexNotifier.value = newIndex,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppNumbers.of(context).spacings.x1,
            children: [
              Text(
                "Тип проекта",
                style: AppTextStyle.of(context).textBody3.copyWith(
                      color: AppColors.of(context).text.secondary,
                    ),
              ),
              AppSegmentControl(
                tabs: const ["Публичный", "Приватный"],
                tabController: typeTabCtrl,
                onLayer: true,
                size: const SegmentControlSizeS(),
                onTap: (newIndex) => typeIndexNotifier.value = newIndex,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
