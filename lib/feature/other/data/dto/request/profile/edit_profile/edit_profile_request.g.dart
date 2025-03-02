// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EditProfileRequestImpl _$$EditProfileRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$EditProfileRequestImpl(
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      dialCode: json['dialCode'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      country: json['country'] as String?,
      languages: json['languages'] as String?,
      userIntrests: json['userIntrests'],
    );

Map<String, dynamic> _$$EditProfileRequestImplToJson(
        _$EditProfileRequestImpl instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'dialCode': instance.dialCode,
      'mobileNumber': instance.mobileNumber,
      'country': instance.country,
      'languages': instance.languages,
      'userIntrests': instance.userIntrests,
    };
