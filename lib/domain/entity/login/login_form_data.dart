import 'package:equatable/equatable.dart';

class LoginFormData extends Equatable {
  final String? login;
  final String? pass;
  final bool isSaveLogin;

  const LoginFormData({
    required this.login,
    required this.pass,
    required this.isSaveLogin,
  });

  bool get isFilled {
    if (login == null || pass == null) return false;

    return (login?.isNotEmpty ?? false) && (pass?.isNotEmpty ?? false);
  }

  LoginFormData copyWith({
    String? login,
    String? pass,
    bool? isSaveLogin,
  }) =>
      LoginFormData(
        login: login ?? this.login,
        pass: pass ?? this.pass,
        isSaveLogin: isSaveLogin ?? this.isSaveLogin,
      );

  @override
  List<Object?> get props => [
        login,
        pass,
        isSaveLogin,
      ];
}
