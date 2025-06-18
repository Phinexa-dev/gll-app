import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_request.freezed.dart';
part 'sign_up_request.g.dart';

@freezed
class SignUpRequest with _$SignUpRequest {
  const factory SignUpRequest({
    @JsonKey(name: "fullName")
    required String fullName,
    @JsonKey(name: "email")
    required String email,
    @JsonKey(name: "dialCode")
    required String dialCode,
    @JsonKey(name: "mobileNumber")
    required String mobileNumber,
    @JsonKey(name: "country")
    required String country,
    @JsonKey(name: "password")
    required String password,
    @JsonKey(name: "confirmPassword")
    required String confirmPassword,
    @JsonKey(name: "gender")
    required String gender,
  }) = _SignUpRequest;

  factory SignUpRequest.fromJson(Map<String, dynamic> json) => _$SignUpRequestFromJson(json);
}
