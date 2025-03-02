import '../../dto/request/skill/add_skill_request.dart';
import '../../dto/response/skill/skill_response.dart';

abstract interface class ISkillRepository {

  Future<List<SkillResponse>> getSkills();

  Future<void> addSkill(List<AddSkillRequest> data);

  Future<SkillResponse> deleteSkill(int skillId);

}