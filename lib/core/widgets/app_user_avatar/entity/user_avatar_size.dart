import 'package:flutter/foundation.dart';

@immutable
sealed class UserAvatarSize {
  const UserAvatarSize();
  double get radius;
}

class UserAvatarSizeS extends UserAvatarSize {
  const UserAvatarSizeS();

  @override
  double get radius => 16;
}

class UserAvatarSizeM extends UserAvatarSize {
  const UserAvatarSizeM();

  @override
  double get radius => 24;
}

class UserAvatarSizeL extends UserAvatarSize {
  const UserAvatarSizeL();

  @override
  double get radius => 32;
}

class UserAvatarSizeXL extends UserAvatarSize {
  const UserAvatarSizeXL();

  @override
  double get radius => 64;
}
