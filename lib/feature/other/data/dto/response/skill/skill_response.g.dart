// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SkillResponseImpl _$$SkillResponseImplFromJson(Map<String, dynamic> json) =>
    _$SkillResponseImpl(
      id: (json['id'] as num).toInt(),
      skill: json['skill'] as String,
      uid: (json['uid'] as num).toInt(),
    );

Map<String, dynamic> _$$SkillResponseImplToJson(_$SkillResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'skill': instance.skill,
      'uid': instance.uid,
    };
