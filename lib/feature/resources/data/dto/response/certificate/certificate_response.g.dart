// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificate_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CertificateResponseImpl _$$CertificateResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CertificateResponseImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      organization: json['organization'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$CertificateResponseImplToJson(
        _$CertificateResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'organization': instance.organization,
      'description': instance.description,
    };
