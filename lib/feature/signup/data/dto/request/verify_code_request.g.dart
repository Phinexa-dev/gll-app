// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_code_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerifyCodeRequestImpl _$$VerifyCodeRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifyCodeRequestImpl(
      email: json['email'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$VerifyCodeRequestImplToJson(
        _$VerifyCodeRequestImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'code': instance.code,
    };
