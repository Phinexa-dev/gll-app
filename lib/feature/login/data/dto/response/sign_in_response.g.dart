// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignInResponseImpl _$$SignInResponseImplFromJson(Map<String, dynamic> json) =>
    _$SignInResponseImpl(
      accessToken: json['access_token'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SignInResponseImplToJson(
        _$SignInResponseImpl instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'user': instance.user,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num).toInt(),
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      dialCode: json['dialCode'] as String,
      mobileNumber: json['mobileNumber'] as String,
      country: json['country'],
      faceBook: json['faceBook'],
      blog: json['blog'],
      twitter: json['twitter'],
      x: json['x'],
      instagram: json['instagram'],
      userIntrests: json['userIntrests'],
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'dialCode': instance.dialCode,
      'mobileNumber': instance.mobileNumber,
      'country': instance.country,
      'faceBook': instance.faceBook,
      'blog': instance.blog,
      'twitter': instance.twitter,
      'x': instance.x,
      'instagram': instance.instagram,
      'userIntrests': instance.userIntrests,
    };
