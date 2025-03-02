import 'package:dio/dio.dart';
import 'package:gll/feature/other/data/dto/request/skill/add_skill_request.dart';
import 'package:gll/feature/other/domain/model/skill/skill_data_model.dart';
import '../../data/repository/skill/iskill_repository.dart';
import 'i_skill_service.dart';

final class SkillService implements ISkillService {
  final ISkillRepository _skillRepository;

  SkillService(this._skillRepository);

  @override
  Future<bool> addSkill(AddSkillRequest data) async {
    try {
      final response = await _skillRepository.addSkill(data);

      // final skillDataModel = _mapToSkillDataModel(response);
      return true;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteSkill(int skillId) async {
    try {
      final response = await _skillRepository.deleteSkill(skillId);

      // final skillDataModel = _mapToSkillDataModel(response);
      return true;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<SkillDataModel>> getSkills() async {
    try {
      final response = await _skillRepository.getSkills();

      final skillsData = response.map((e) => _mapToSkillDataModel(e)).toList();
      return skillsData;

    } on DioException catch (_) {
      rethrow;
    }
  }

  SkillDataModel _mapToSkillDataModel(dynamic response) {
    return SkillDataModel(
      id: response.id,
      skill: response.skill,
    );
  }

}