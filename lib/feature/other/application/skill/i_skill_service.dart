import '../../data/dto/request/skill/add_skill_request.dart';
import '../../domain/model/skill/skill_data_model.dart';

abstract interface class ISkillService {

  Future<List<SkillDataModel>> getSkills();

  Future<bool> addSkill(List<AddSkillRequest> data);

  Future<bool> deleteSkill(int skillId);
}