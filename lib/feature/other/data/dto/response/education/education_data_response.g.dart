// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EducationDataResponseImpl _$$EducationDataResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$EducationDataResponseImpl(
      id: (json['id'] as num).toInt(),
      uid: (json['uid'] as num).toInt(),
      school: json['school'] as String,
      degree: json['degree'] as String,
      startdate: DateTime.parse(json['startdate'] as String),
      enddate: DateTime.parse(json['enddate'] as String),
    );

Map<String, dynamic> _$$EducationDataResponseImplToJson(
        _$EducationDataResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'school': instance.school,
      'degree': instance.degree,
      'startdate': instance.startdate.toIso8601String(),
      'enddate': instance.enddate.toIso8601String(),
    };
