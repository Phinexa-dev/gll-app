// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_education_data_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateEducationDataRequestImpl _$$UpdateEducationDataRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateEducationDataRequestImpl(
      school: json['school'] as String?,
      degree: json['degree'] as String?,
      startdate: json['startdate'] == null
          ? null
          : DateTime.parse(json['startdate'] as String),
      enddate: json['enddate'] == null
          ? null
          : DateTime.parse(json['enddate'] as String),
    );

Map<String, dynamic> _$$UpdateEducationDataRequestImplToJson(
        _$UpdateEducationDataRequestImpl instance) =>
    <String, dynamic>{
      'school': instance.school,
      'degree': instance.degree,
      'startdate': instance.startdate?.toIso8601String(),
      'enddate': instance.enddate?.toIso8601String(),
    };
