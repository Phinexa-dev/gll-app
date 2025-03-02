import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/core/data/remote/network_service.dart';
import 'package:gll/feature/other/data/dto/request/profile/editSocials/edit_social_request.dart';
import 'package:gll/feature/other/data/dto/request/profile/edit_profile/edit_profile_request.dart';
import 'package:gll/feature/other/data/dto/response/profile/edit_profile_response.dart';
import 'package:retrofit/retrofit.dart';

part 'edit_profile_api.g.dart';

final editProfileApiProvider = Provider<EditProfileApi>((ref) {
  final Dio dio = ref.watch(networkServiceProvider);
  return EditProfileApi(dio);
});

@RestApi()
@Header('Content-Type : application/json')
abstract class EditProfileApi {
  factory EditProfileApi(Dio dio) => _EditProfileApi(dio);

  @PATCH('/user/{id}')
  Future<EditProfileResponse> editProfile(@Body() EditProfileRequest data, @Path('id') int userId);

  @PATCH('/user/{id}')
  Future<EditProfileResponse> editSocials(@Body() EditSocialRequest data, @Path('id') int userId);
}