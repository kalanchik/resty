import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/core/inherited/app_assets.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/inherited/app_text_style.dart';
import 'package:postmanovich/core/utils/user_listener/bloc/user_listener_bloc.dart';
import 'package:postmanovich/core/widgets/app_icon/app_icon.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppNumbers.of(context).spacings.x2,
      children: [
        BlocBuilder<UserListenerBloc, UserListenerState>(
          bloc: context.read<UserListenerBloc>(),
          builder: (context, state) {
            if (state is UserSignInState) {
              return Text(
                "С возвращением, ${state.user.displayName ?? "Неизвестно"} 👋",
                style: AppTextStyle.of(context).headersSubheader1.copyWith(
                      color: AppColors.of(context).text.primary,
                    ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.of(context).bs.layerAccent,
            borderRadius: BorderRadius.all(
              Radius.circular(AppNumbers.of(context).brRadius.s),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppNumbers.of(context).spacings.x3,
              vertical: AppNumbers.of(context).spacings.x1_5,
            ),
            child: Row(
              spacing: AppNumbers.of(context).spacings.x2,
              children: [
                AppIcon(
                  icon: AppAssets.of(context).questionOutline,
                  color: AppColors.of(context).icons.warn,
                ),
                Flexible(
                  child: Text(
                    "Нашли баг? Создайте bug report, чтобы помочь проекту стать лучше.",
                    style: AppTextStyle.of(context).textBody3.copyWith(
                          color: AppColors.of(context).text.secondary,
                        ),
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    child: Text(
                      "Подробнее",
                      style: AppTextStyle.of(context).buttonss.copyWith(
                            color: AppColors.of(context).text.brand,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
