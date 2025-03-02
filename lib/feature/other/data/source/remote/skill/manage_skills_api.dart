import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/core/data/remote/network_service.dart';
import 'package:gll/feature/other/data/dto/request/skill/add_skill_request.dart';
import 'package:gll/feature/other/data/dto/response/skill/skill_response.dart';
import 'package:retrofit/retrofit.dart';

part 'manage_skills_api.g.dart';

final manageSkillsApiProvider = Provider<ManageSkillsApi>((ref) {
  final Dio dio = ref.watch(networkServiceProvider);
  return ManageSkillsApi(dio);
});

@RestApi()
@Header('Content-Type : application/json')
abstract class ManageSkillsApi {
  factory ManageSkillsApi(Dio dio) => _ManageSkillsApi(dio);
  
  @GET('/userprofessionalskill')
  Future<List<SkillResponse>> getSkills();

  @POST('/userprofessionalskill')
  Future<void> addSkill(@Body() AddSkillRequest data);

  @DELETE('/userprofessionalskill/{id}')
  Future<SkillResponse> deleteSkill(@Path('id') int skillId);
}