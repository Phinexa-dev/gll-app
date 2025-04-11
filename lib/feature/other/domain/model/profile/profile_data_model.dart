import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_data_model.freezed.dart';

@freezed
class ProfileDataModel with _$ProfileDataModel {
  factory ProfileDataModel({
    required int id,
    required String fullName,
    required String email,
    required String dialCode,
    required String mobileNumber,
    // required String password,
    required String? languages,
    required String? country,
    required String? faceBook,
    required String? blog,
    required String? twitter,
    required String? x,
    required String? instagram,
    required String? userIntrests,
  }) = _ProfileDataModel;
}