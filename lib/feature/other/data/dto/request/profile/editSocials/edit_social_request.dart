import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_social_request.freezed.dart';
part 'edit_social_request.g.dart';

@freezed
class EditSocialRequest with _$EditSocialRequest {
  const factory EditSocialRequest({
    @JsonKey(name: "faceBook")
    dynamic faceBook,
    @JsonKey(name: "blog")
    dynamic blog,
    @JsonKey(name: "twitter")
    dynamic twitter,
    @JsonKey(name: "x")
    dynamic x,
    @JsonKey(name: "instagram")
    dynamic instagram,
  }) = _EditSocialRequest;

  factory EditSocialRequest.fromJson(Map<String, dynamic> json) => _$EditSocialRequestFromJson(json);
}
