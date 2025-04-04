import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gll/feature/other/domain/model/skill/skill_data_model.dart';

part 'skill_state.freezed.dart';

@freezed
class SkillState with _$SkillState {

  factory SkillState({
    @Default(false) bool isLoading,
    bool? isSuccess,
    bool? isFailure,
    String? errorMessage,
    @Default({}) Map<String, dynamic>? form,
    @Default([]) List<SkillDataModel> skills,
    @Default([]) List<SkillDataModel> unsavedSkills,
  }) = _SkillState;
}
