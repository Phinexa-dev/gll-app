import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/core/data/local/user/user_service.dart';
import 'package:gll/feature/other/data/dto/request/profile/editSocials/edit_social_request.dart';
import 'package:gll/feature/other/presentation/state/profile/profile_state.dart';
import '../../../application/profile/profile_service.dart';
import '../../../data/dto/request/profile/edit_profile/edit_profile_request.dart';

final profileControllerProvider = AutoDisposeNotifierProvider<ProfileController, ProfileState>(ProfileController.new);

class ProfileController extends AutoDisposeNotifier<ProfileState> {

  @override
  ProfileState build() {
    return ProfileState();
  }

  Future<void> editProfile() async {
    final fullName = state.form?['fullName'];
    final email = state.form?['email'];
    final dialCode = state.form?['dialCode'];
    final phoneNumber = state.form?['phoneNumber'];
    final country = state.form?['country'];
    final interests = state.form?['interests'];
    final languages = state.form?['languages'];


    if (email == null || fullName == null || dialCode == null || phoneNumber == null || country == null || interests == null || languages == null) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        errorMessage: 'Please fill all fields',
      );
      return;
    }

    try{

      state = state.copyWith(
        isLoading: true,
        isSuccess: null,
        isFailure: null,
      );

      final editProfileRequest = EditProfileRequest(
        fullName: fullName,
        email: email,
        dialCode: dialCode,
        mobileNumber: phoneNumber,
        country: country,
        languages: languages,
        userInterests: interests,
      );

      final user = await ref.read(userServiceProvider).getUser();
      final result = await ref.read(profileServiceProvider).editProfile(editProfileRequest, user!.id);

      state = state.copyWith(
        isLoading: false,
        isSuccess: result,
        isFailure: !result,
      );

    }
    on DioException catch(e){
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        errorMessage: e.response?.statusMessage?? 'An error occurred',
      );
    }
  }

  Future<void> editSocials() async {
    final facebook = state.form?['facebook'];
    final blog = state.form?['blog'];
    final twitter = state.form?['twitter'];
    final x = state.form?['x'];
    final instagram = state.form?['instagram'];

    if (facebook == null || blog == null || twitter == null || x == null || instagram == null) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        errorMessage: 'Please fill all fields',
      );
      return;
    }

    try{

      state = state.copyWith(
        isLoading: true,
        isSuccess: null,
        isFailure: null,
      );

      final editSocialsRequest = EditSocialRequest(
        faceBook: facebook,
        blog: blog,
        twitter: twitter,
        x: x,
        instagram: instagram,
      );

      final user = await ref.read(userServiceProvider).getUser();
      final result = await ref.read(profileServiceProvider).editSocials(editSocialsRequest, user!.id);

      state = state.copyWith(
        isLoading: false,
        isSuccess: result,
        isFailure: !result,
      );

    }
    on DioException catch(e){
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        errorMessage: e.response?.statusMessage?? 'An error occurred',
      );
    }
  }

  void setFormData(Map<String, dynamic> formData) {
    state = state.copyWith(
      form: formData,
    );
  }

}