import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_response.freezed.dart';
part 'sign_in_response.g.dart';

@freezed
class SignInResponse with _$SignInResponse {
  const factory SignInResponse({
    @JsonKey(name: "access_token")
    required String accessToken,
    @JsonKey(name: "user")
    required User user,
  }) = _SignInResponse;

  factory SignInResponse.fromJson(Map<String, dynamic> json) => _$SignInResponseFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: "id")
    required int id,
    @JsonKey(name: "fullName")
    required String fullName,
    @JsonKey(name: "email")
    required String email,
    @JsonKey(name: "dialCode")
    required String dialCode,
    @JsonKey(name: "mobileNumber")
    required String mobileNumber,
    @JsonKey(name: "country")
    required dynamic country,
    @JsonKey(name: "faceBook")
    required dynamic faceBook,
    @JsonKey(name: "blog")
    required dynamic blog,
    @JsonKey(name: "twitter")
    required dynamic twitter,
    @JsonKey(name: "x")
    required dynamic x,
    @JsonKey(name: "instagram")
    required dynamic instagram,
    @JsonKey(name: "userIntrests")
    required dynamic userIntrests,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
