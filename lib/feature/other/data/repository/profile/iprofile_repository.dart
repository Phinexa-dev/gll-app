import '../../dto/request/profile/editSocials/edit_social_request.dart';
import '../../dto/request/profile/edit_profile/edit_profile_request.dart';
import '../../dto/response/profile/edit_profile_response.dart';

abstract interface class IProfileRepository {

  Future<EditProfileResponse> editProfile(EditProfileRequest data, int userId);

  Future<EditProfileResponse> editSkills(EditSocialRequest data, int userId);
}