import 'package:equatable/equatable.dart';

class RequestEntry extends Equatable {
  const RequestEntry({
    required this.key,
    required this.value,
    this.isActive = true,
  });

  final String key;
  final String value;
  final bool isActive;

  RequestEntry copyWith({
    String? key,
    String? value,
    bool? isActive,
  }) {
    return RequestEntry(
      key: key ?? this.key,
      value: value ?? this.value,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  List<Object?> get props => [
        key,
        value,
        isActive,
      ];
}
