import '../../data/dto/request/profile/editSocials/edit_social_request.dart';
import '../../data/dto/request/profile/edit_profile/edit_profile_request.dart';
import '../../domain/model/profile/profile_data_model.dart';

abstract interface class IProfileService {

  Future<bool> editProfile(EditProfileRequest data, int userId);

  Future<bool> editSocials(EditSocialRequest data, int userId);

  Future<ProfileDataModel> getProfile();

  Future<void> deleteProfile(int userId);
}