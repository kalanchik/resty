import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/core/inherited/app_assets.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/toast/app_toast.dart';
import 'package:postmanovich/core/toast/snack_bar_type.dart';
import 'package:postmanovich/core/utils/sign_out_bloc/sign_out_bloc.dart';
import 'package:postmanovich/core/widgets/app_icon/app_icon.dart';
import 'package:postmanovich/domain/use_case/user_use_case/user_use_case.dart';
import 'package:postmanovich/features/main/widget/main_menu_content/widget/main_menu_item.dart';
import 'package:postmanovich/features/main/widget/main_menu_content/widget/menu_user_info.dart';

class MainMenuContent extends StatelessWidget {
  const MainMenuContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignOutBloc(context.read<UserUseCase>()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppNumbers.of(context).spacings.x3,
            ),
            child: Column(
              spacing: AppNumbers.of(context).spacings.x2,
              children: [
                MainMenuItem(
                  onTap: () {},
                  icon: AppIcon(
                    icon: AppAssets.of(context).book,
                    size: 16,
                    color: AppColors.of(context).icons.secondary,
                  ),
                  title: "Главная",
                  isActive: true,
                ),
                MainMenuItem(
                  onTap: () => AppToast.show(
                    context,
                    type: const SnackBarTypeWarn(isFilled: true),
                    title: null,
                    body: "Данная страница еще в разработке",
                  ),
                  icon: AppIcon(
                    icon: AppAssets.of(context).apps,
                    size: 16,
                    color: AppColors.of(context).icons.secondary,
                  ),
                  title: "Каталог",
                ),
                MainMenuItem(
                  onTap: () => AppToast.show(
                    context,
                    type: const SnackBarTypeWarn(isFilled: true),
                    title: null,
                    body: "Данная страница еще в разработке",
                  ),
                  icon: AppIcon(
                    icon: AppAssets.of(context).brush,
                    size: 16,
                    color: AppColors.of(context).icons.secondary,
                  ),
                  title: "Темы",
                ),
                MainMenuItem(
                  onTap: () => AppToast.show(
                    context,
                    type: const SnackBarTypeWarn(isFilled: true),
                    title: null,
                    body: "Данная страница еще в разработке",
                  ),
                  icon: AppIcon(
                    icon: AppAssets.of(context).settings,
                    size: 16,
                    color: AppColors.of(context).icons.secondary,
                  ),
                  title: "Настройки",
                ),
                MainMenuItem(
                  onTap: () => AppToast.show(
                    context,
                    type: const SnackBarTypeWarn(isFilled: true),
                    title: null,
                    body: "Данная страница еще в разработке",
                  ),
                  icon: AppIcon(
                    icon: AppAssets.of(context).box,
                    size: 16,
                    color: AppColors.of(context).icons.secondary,
                  ),
                  title: "Change log",
                ),
              ],
            ),
          ),
          const MenuUserInfo(),
        ],
      ),
    );
  }
}
