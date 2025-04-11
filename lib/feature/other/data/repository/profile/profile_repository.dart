import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/other/data/dto/request/profile/editSocials/edit_social_request.dart';
import 'package:gll/feature/other/data/dto/request/profile/edit_profile/edit_profile_request.dart';
import 'package:gll/feature/other/data/dto/response/profile/edit_profile_response.dart';
import 'package:gll/feature/other/data/source/remote/profile/edit_profile_api.dart';
import 'iprofile_repository.dart';

final profileRepositoryProvider = Provider<IProfileRepository>((ref) {
  final EditProfileApi profileApi = ref.watch(editProfileApiProvider);
  return ProfileRepository(profileApi);
});

final class ProfileRepository implements IProfileRepository {
  final EditProfileApi _profileApi;

  ProfileRepository(this._profileApi);

  @override
  Future<EditProfileResponse> editProfile(EditProfileRequest data, int userId) async {
    try {

      final response = await _profileApi.editProfile(data, userId);
      return response;

    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<EditProfileResponse> editSocials(EditSocialRequest data, int userId) async {
    try {

      final response = await _profileApi.editSocials(data, userId);
      return response;

    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<EditProfileResponse> getProfile() async {
    try {

      final response = await _profileApi.getProfile();
      return response;

    } on DioException catch (_) {
      rethrow;
    }
  }
}