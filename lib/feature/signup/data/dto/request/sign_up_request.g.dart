// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignUpRequestImpl _$$SignUpRequestImplFromJson(Map<String, dynamic> json) =>
    _$SignUpRequestImpl(
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      dialCode: json['dialCode'] as String,
      mobileNumber: json['mobileNumber'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String,
    );

Map<String, dynamic> _$$SignUpRequestImplToJson(_$SignUpRequestImpl instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'dialCode': instance.dialCode,
      'mobileNumber': instance.mobileNumber,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
    };
