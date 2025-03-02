import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_request.freezed.dart';
part 'edit_profile_request.g.dart';

@freezed
class EditProfileRequest with _$EditProfileRequest {
  const factory EditProfileRequest({
    @JsonKey(name: "fullName")
    String? fullName,
    @JsonKey(name: "email")
    String? email,
    @JsonKey(name: "dialCode")
    String? dialCode,
    @JsonKey(name: "mobileNumber")
    String? mobileNumber,
    @JsonKey(name: "country")
    String? country,
    @JsonKey(name: "languages")
    String? languages,
    @JsonKey(name: "userIntrests")
    dynamic userIntrests,
  }) = _EditProfileRequest;

  factory EditProfileRequest.fromJson(Map<String, dynamic> json) => _$EditProfileRequestFromJson(json);
}
