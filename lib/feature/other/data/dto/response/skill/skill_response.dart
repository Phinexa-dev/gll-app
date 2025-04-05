import 'package:freezed_annotation/freezed_annotation.dart';

part 'skill_response.freezed.dart';
part 'skill_response.g.dart';

@freezed
class SkillResponse with _$SkillResponse {
  const factory SkillResponse({
    @JsonKey(name: "id")
    required int id,
    @JsonKey(name: "skill")
    required String skill,
    @JsonKey(name: "uid")
    required int uid,
  }) = _SkillResponse;

  factory SkillResponse.fromJson(Map<String, dynamic> json) => _$SkillResponseFromJson(json);
}
