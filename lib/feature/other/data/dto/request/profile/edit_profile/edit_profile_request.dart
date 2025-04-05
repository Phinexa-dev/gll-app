import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'edit_profile_request.freezed.dart';
part 'edit_profile_request.g.dart';

@freezed
class EditProfileRequest with _$EditProfileRequest {
  const factory EditProfileRequest({
    @JsonKey(name: "fullName")
    String? fullName,
    @JsonKey(name: "dialCode")
    String? dialCode,
    @JsonKey(name: "mobileNumber")
    String? mobileNumber,
    @JsonKey(name: "userLanguages")
    String? userLanguages,
    @JsonKey(name: "country")
    String? country,
    @JsonKey(name: "userIntrests")
    String? userIntrests,
  }) = _EditProfileRequest;

  factory EditProfileRequest.fromJson(Map<String, dynamic> json) => _$EditProfileRequestFromJson(json);
}
