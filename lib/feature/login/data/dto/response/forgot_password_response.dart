import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_response.freezed.dart';
part 'forgot_password_response.g.dart';

@freezed
class ForgotPasswordResponse with _$ForgotPasswordResponse {
  const factory ForgotPasswordResponse({
    @JsonKey(name: "message") required String message,
  }) = _ForgotPasswordResponse;

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseFromJson(json);
} 