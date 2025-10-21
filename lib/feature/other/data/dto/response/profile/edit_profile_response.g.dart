// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EditProfileResponseImpl _$$EditProfileResponseImplFromJson(
  Map<String, dynamic> json,
) => _$EditProfileResponseImpl(
  id: (json['id'] as num).toInt(),
  fullName: json['fullName'] as String,
  email: json['email'] as String,
  dialCode: json['dialCode'] as String,
  mobileNumber: json['mobileNumber'] as String,
  password: json['password'] as String,
  country: json['country'] as String?,
  faceBook: json['faceBook'] as String?,
  blog: json['blog'] as String?,
  twitter: json['twitter'] as String?,
  x: json['x'] as String?,
  instagram: json['instagram'] as String?,
  userIntrests: json['userIntrests'] as String?,
  languages: json['userLanguages'] as String?,
  profileImage: json['userProfilePicture'] as String?,
  gender: json['gender'] as String?,
);

Map<String, dynamic> _$$EditProfileResponseImplToJson(
  _$EditProfileResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'fullName': instance.fullName,
  'email': instance.email,
  'dialCode': instance.dialCode,
  'mobileNumber': instance.mobileNumber,
  'password': instance.password,
  'country': instance.country,
  'faceBook': instance.faceBook,
  'blog': instance.blog,
  'twitter': instance.twitter,
  'x': instance.x,
  'instagram': instance.instagram,
  'userIntrests': instance.userIntrests,
  'userLanguages': instance.languages,
  'userProfilePicture': instance.profileImage,
  'gender': instance.gender,
};
