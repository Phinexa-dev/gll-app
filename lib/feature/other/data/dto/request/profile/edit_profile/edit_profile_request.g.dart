// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EditProfileRequestImpl _$$EditProfileRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$EditProfileRequestImpl(
      fullName: json['fullName'] as String?,
      dialCode: json['dialCode'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      userLanguages: json['userLanguages'] as String?,
      country: json['country'] as String?,
      userIntrests: json['userIntrests'] as String?,
    );

Map<String, dynamic> _$$EditProfileRequestImplToJson(
        _$EditProfileRequestImpl instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'dialCode': instance.dialCode,
      'mobileNumber': instance.mobileNumber,
      'userLanguages': instance.userLanguages,
      'country': instance.country,
      'userIntrests': instance.userIntrests,
    };
