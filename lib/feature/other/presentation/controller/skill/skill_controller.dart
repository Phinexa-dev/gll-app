import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/other/application/skill/skill_service.dart';
import 'package:gll/feature/other/data/dto/request/skill/add_skill_request.dart';
import 'package:gll/feature/other/presentation/state/skill/skill_state.dart';

import '../../../../system_feedback/model/feedback.dart';
import '../../../../system_feedback/provider/feedback_provider.dart';
import '../../../domain/model/skill/skill_data_model.dart';

final skillControllerProvider = AutoDisposeNotifierProvider<SkillController, SkillState>(SkillController.new);

class SkillController extends AutoDisposeNotifier<SkillState> {

  @override
  SkillState build() {
    return SkillState();
  }

  Future<void> getSkills() async {
    try{

      state = state.copyWith(
        isLoading: true,
        isSuccess: null,
        isFailure: null,
      );

      final result = await ref.read(skillServiceProvider).getSkills();

      state = state.copyWith(
        isLoading: false,
        isSuccess: null,
        isFailure: false,
        skills: result,
      );

    }
    on DioException catch(e){
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        errorMessage: e.response?.statusMessage?? 'An error occurred',
      );
    }
  }

  Future<void> removeUnsavedSkills() async {

    state = state.copyWith(
      unsavedSkills: [],
    );
  }

  Future<void> addSkill(String skill) async {

    var rng = Random();
    final randomSkillId = rng.nextInt(100)+rng.nextInt(1000);
    final newSkill = SkillDataModel(id: randomSkillId, skill: skill);

    // add skill to unsaved skills
    final unsavedSkills = List<SkillDataModel>.from(state.unsavedSkills);
    unsavedSkills.add(newSkill);

    state = state.copyWith(
      unsavedSkills: unsavedSkills,
    );
  }

  Future<void> updateSkills() async {

    try{

      state = state.copyWith(
        isLoading: true,
        isSuccess: null,
        isFailure: null,
      );

      // collect unsaved skills
      final unsavedSkills = List<SkillDataModel>.from(state.unsavedSkills);
      final List<AddSkillRequest> addSkillRequests = unsavedSkills.map(
              (skillData) => AddSkillRequest(skill: skillData.skill)
      ).toList();

      final result = await ref.read(skillServiceProvider).addSkill(addSkillRequests);

      if (result) {

        state = state.copyWith(
          isFailure: false,
          isSuccess: null,
          unsavedSkills: [],
        );

        await getSkills();
        final lastCharacter = unsavedSkills.length > 1? "s" : "";
        final feedBackService = ref.read(feedbackServiceProvider);
        feedBackService.showToast("Skill$lastCharacter added", type: FeedbackType.success);
      }
      else {
        state = state.copyWith(
          isLoading: false,
          isSuccess: false,
          isFailure: true,
          errorMessage: 'An error occurred',
        );
      }

    }
    on DioException catch(e){
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        errorMessage: e.response?.statusMessage?? 'An error occurred',
      );
    }
  }

  void deleteSkill(int skillId) async {

    // directly delete if skill is from unsaved skills
    final unsavedSkills = List<SkillDataModel>.from(state.unsavedSkills);
    final bool isUnsavedSkill = unsavedSkills.any((skill) => skill.id == skillId);
    if (isUnsavedSkill) {
      unsavedSkills.removeWhere((skill) => skill.id == skillId);
      state = state.copyWith(
        unsavedSkills: unsavedSkills,
      );
      return;
    }

    try{

      state = state.copyWith(
        isLoading: true,
        isSuccess: null,
        isFailure: null,
      );

      final result = await ref.read(skillServiceProvider).deleteSkill(skillId);

      // remove skill from skills
      final skills = List<SkillDataModel>.from(state.skills);
      skills.removeWhere((skill) => skill.id == skillId);
      state = state.copyWith(
        skills: skills,
      );

      state = state.copyWith(
        isLoading: false,
        isSuccess: result,
        isFailure: !result,
      );
    }
    on DioException catch(e){
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        errorMessage: e.response?.statusMessage?? 'An error occurred',
      );
    }
  }

  void setFormData(Map<String, dynamic> formData) {
    state = state.copyWith(
      form: formData,
    );
  }

}