import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/other/application/skill/skill_service.dart';
import 'package:gll/feature/other/data/dto/request/skill/add_skill_request.dart';
import 'package:gll/feature/other/presentation/state/skill/skill_state.dart';

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
        isSuccess: true,
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

  Future<void> addSkill() async {
    final skill = state.form!['skill'];

    if (skill == null) {
      // state = state.copyWith(
      //   isSuccess: false,
      //   isFailure: true,
      //   errorMessage: 'Skill is required',
      // );
      return;
    }

    try{

      state = state.copyWith(
        isLoading: true,
        isSuccess: null,
        isFailure: null,
      );

      final addSkillRequest = AddSkillRequest(skill: skill);

      final result = await ref.read(skillServiceProvider).addSkill([addSkillRequest]);

      if (result) {
        await getSkills();
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

    try{

      state = state.copyWith(
        isLoading: true,
        isSuccess: null,
        isFailure: null,
      );

      final result = await ref.read(skillServiceProvider).deleteSkill(skillId);

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