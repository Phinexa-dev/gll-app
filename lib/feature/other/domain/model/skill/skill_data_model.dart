import 'package:freezed_annotation/freezed_annotation.dart';

part 'skill_data_model.freezed.dart';

@freezed
class SkillDataModel with _$SkillDataModel {
  const factory SkillDataModel({
    required int id,
    required String skill,
  }) = _SkillDataModel;
}
