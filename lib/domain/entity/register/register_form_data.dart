import 'package:equatable/equatable.dart';

class RegisterFormData extends Equatable {
  final String? username;
  final String? email;
  final String? password;

  const RegisterFormData({
    this.username,
    this.email,
    this.password,
  });

  bool get isValid {
    return username != null &&
        email != null &&
        password != null &&
        username!.isNotEmpty &&
        email!.isNotEmpty &&
        password!.isNotEmpty;
  }

  RegisterFormData copyWith({
    String? username,
    String? email,
    String? password,
  }) {
    return RegisterFormData(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [username, email, password];
}
