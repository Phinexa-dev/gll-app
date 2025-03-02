import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'add_skill_request.freezed.dart';
part 'add_skill_request.g.dart';

@freezed
class AddSkillRequest with _$AddSkillRequest {
  const factory AddSkillRequest({
    @JsonKey(name: "skill")
    required String skill,
  }) = _AddSkillRequest;

  factory AddSkillRequest.fromJson(Map<String, dynamic> json) => _$AddSkillRequestFromJson(json);
}
