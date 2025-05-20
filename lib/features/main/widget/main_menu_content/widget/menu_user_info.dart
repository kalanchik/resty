import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/core/inherited/app_assets.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/inherited/app_text_style.dart';
import 'package:postmanovich/core/toast/app_toast.dart';
import 'package:postmanovich/core/utils/sign_out_bloc/sign_out_bloc.dart';
import 'package:postmanovich/core/utils/user_listener/bloc/user_listener_bloc.dart';
import 'package:postmanovich/core/widgets/app_icon/app_icon.dart';
import 'package:postmanovich/core/widgets/app_user_avatar/entity/user_avatar_size.dart';
import 'package:postmanovich/core/widgets/app_user_avatar/view/app_user_avatar.dart';

class MenuUserInfo extends StatelessWidget {
  const MenuUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppNumbers.of(context).spacings.x3,
        vertical: AppNumbers.of(context).spacings.x2,
      ),
      child: BlocBuilder<UserListenerBloc, UserListenerState>(
        bloc: context.read<UserListenerBloc>(),
        builder: (context, state) {
          if (state is UserSignInState) {
            return Row(
              spacing: AppNumbers.of(context).spacings.x2,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppUserAvatar(
                  photoUrl: state.user.photoURL,
                  size: const UserAvatarSizeL(),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: AppNumbers.of(context).spacings.x_5,
                    children: [
                      Text(
                        state.user.displayName ?? "Неизвестно",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.of(context).textBody3.copyWith(
                              color: AppColors.of(context).text.primary,
                            ),
                      ),
                      Text(
                        state.user.email ?? "Неизвестно",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.of(context).textBody3.copyWith(
                              color: AppColors.of(context).text.secondary,
                              fontSize: 10,
                            ),
                      ),
                    ],
                  ),
                ),
                BlocConsumer<SignOutBloc, SignOutState>(
                  bloc: context.read<SignOutBloc>(),
                  listener: (context, state) {
                    if (state is SignOutSuccess) {
                      AppToast.show(
                        context,
                        title: null,
                        body: "Вы вышли из аккаунта",
                      );
                    }
                  },
                  builder: (context, state) {
                    return InkWell(
                      onTap: state is SignOutLoading
                          ? null
                          : () => context
                              .read<SignOutBloc>()
                              .add(FetchSignOutEvent()),
                      child: AppIcon(
                        icon: AppAssets.of(context).signOut,
                        color: AppColors.of(context).icons.secondary,
                      ),
                    );
                  },
                )
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
