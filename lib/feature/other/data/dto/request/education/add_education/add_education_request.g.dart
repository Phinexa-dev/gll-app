// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_education_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddEducationRequestImpl _$$AddEducationRequestImplFromJson(
  Map<String, dynamic> json,
) => _$AddEducationRequestImpl(
  school: json['school'] as String,
  degree: json['degree'] as String,
  startdate: DateTime.parse(json['startdate'] as String),
  enddate: DateTime.parse(json['enddate'] as String),
);

Map<String, dynamic> _$$AddEducationRequestImplToJson(
  _$AddEducationRequestImpl instance,
) => <String, dynamic>{
  'school': instance.school,
  'degree': instance.degree,
  'startdate': instance.startdate.toIso8601String(),
  'enddate': instance.enddate.toIso8601String(),
};
