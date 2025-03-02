import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_social_request.freezed.dart';
part 'edit_social_request.g.dart';

@freezed
class EditSocialRequest with _$EditSocialRequest {
  const factory EditSocialRequest({
    @JsonKey(name: "faceBook")
    String? faceBook,
    @JsonKey(name: "blog")
    String? blog,
    @JsonKey(name: "twitter")
    String? twitter,
    @JsonKey(name: "x")
    String? x,
    @JsonKey(name: "instagram")
    String? instagram,
  }) = _EditSocialRequest;

  factory EditSocialRequest.fromJson(Map<String, dynamic> json) => _$EditSocialRequestFromJson(json);
}
