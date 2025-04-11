import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'edit_profile_response.freezed.dart';
part 'edit_profile_response.g.dart';

@freezed
class EditProfileResponse with _$EditProfileResponse {
  const factory EditProfileResponse({
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
    @JsonKey(name: "password")
    required String password,
    @JsonKey(name: "country")
    required String? country,
    @JsonKey(name: "faceBook")
    required String? faceBook,
    @JsonKey(name: "blog")
    required String? blog,
    @JsonKey(name: "twitter")
    required String? twitter,
    @JsonKey(name: "x")
    required String? x,
    @JsonKey(name: "instagram")
    required String? instagram,
    @JsonKey(name: "userIntrests")
    required String? userIntrests,
    @JsonKey(name: "userLanguages")
    required String? languages,
  }) = _EditProfileResponse;

  factory EditProfileResponse.fromJson(Map<String, dynamic> json) => _$EditProfileResponseFromJson(json);
}
