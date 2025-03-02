import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/other/data/dto/request/profile/editSocials/edit_social_request.dart';
import 'package:gll/feature/other/data/dto/request/profile/edit_profile/edit_profile_request.dart';
import 'package:gll/feature/other/domain/model/profile/profile_data_model.dart';
import '../../data/repository/profile/iprofile_repository.dart';
import '../../data/repository/profile/profile_repository.dart';
import 'iprofile_service.dart';

final profileServiceProvider = Provider<ProfileService>((ref) {
  final profileRepository = ref.watch(profileRepositoryProvider);
  return ProfileService(profileRepository);
});

final class ProfileService implements IProfileService {
  final IProfileRepository _profileRepository;

  ProfileService(this._profileRepository);

  @override
  Future<bool> editProfile(EditProfileRequest data, int userId) async {
    try {
      final response = await _profileRepository.editProfile(data, userId);

      // final profileDataModel = _mapToProfileDataModel(response);
      return true;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool> editSkills(EditSocialRequest data, int userId) async {
    try {
      final response = await _profileRepository.editSkills(data, userId);

      // final profileDataModel = _mapToProfileDataModel(response);
      return true;
    } on DioException catch (_) {
      rethrow;
    }
  }

  ProfileDataModel _mapToProfileDataModel(dynamic response) {
    return ProfileDataModel(
      id: response.id,
      fullName: response.fullName,
      email: response.email,
      dialCode: response.dialCode,
      mobileNumber: response.mobileNumber,
      country: response.country,
      faceBook: response.faceBook,
      blog: response.blog,
      twitter: response.twitter,
      x: response.x,
      instagram: response.instagram,
      userIntrests: response.userIntrests,
    );
  }
}