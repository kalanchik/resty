import 'package:flutter/material.dart';
import 'package:postmanovich/core/inherited/app_assets.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/widgets/app_icon/app_icon.dart';
import 'package:postmanovich/core/widgets/app_user_avatar/entity/user_avatar_size.dart';

class AppUserAvatar extends StatelessWidget {
  const AppUserAvatar({
    super.key,
    this.photoUrl,
    this.size = const UserAvatarSizeS(),
  });

  final String? photoUrl;
  final UserAvatarSize size;

  @override
  Widget build(BuildContext context) {
    final Widget content = photoUrl != null
        ? ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(999),
            ),
            child: Image.network(
              photoUrl!,
              fit: BoxFit.cover,
            ),
          )
        : DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.of(context).bs.layerAccent,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: AppIcon(
                icon: AppAssets.of(context).user,
                size: switch (size) {
                  UserAvatarSizeS() => 10,
                  UserAvatarSizeM() => 14,
                  UserAvatarSizeL() => 18,
                  UserAvatarSizeXL() => 32,
                },
              ),
            ),
          );

    return SizedBox(
      width: size.radius,
      height: size.radius,
      child: content,
    );
  }
}
