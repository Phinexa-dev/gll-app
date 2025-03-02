import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/other/data/dto/request/skill/add_skill_request.dart';
import 'package:gll/feature/other/data/dto/response/skill/skill_response.dart';
import 'package:gll/feature/other/data/source/remote/skill/manage_skills_api.dart';
import 'iskill_repository.dart';


final skillRepositoryProvider = Provider<ISkillRepository>((ref) {
  final ManageSkillsApi skillApi = ref.watch(manageSkillsApiProvider);
  return SkillRepository(skillApi);
});

final class SkillRepository implements ISkillRepository {
  final ManageSkillsApi _skillApi;

  SkillRepository(this._skillApi);

  @override
  Future<void> addSkill(List<AddSkillRequest> data) async {
    try {

      await _skillApi.addSkill(data);

    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<SkillResponse> deleteSkill(int skillId) async {
    try {

      final response = await _skillApi.deleteSkill(skillId);
      return response;

    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<SkillResponse>> getSkills() async {
    try {

      final response = await _skillApi.getSkills();
      return response;

    } on DioException catch (_) {
      rethrow;
    }
  }
}