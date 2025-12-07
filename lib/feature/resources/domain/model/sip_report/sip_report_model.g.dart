// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sip_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SipReportUserImpl _$$SipReportUserImplFromJson(Map<String, dynamic> json) =>
    _$SipReportUserImpl(
      id: (json['id'] as num).toInt(),
      fullName: json['fullName'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$SipReportUserImplToJson(_$SipReportUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
    };

_$SipReportModelImpl _$$SipReportModelImplFromJson(Map<String, dynamic> json) =>
    _$SipReportModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      link: json['link'] as String?,
      approved: (json['approved'] as num).toInt(),
      uid: (json['uid'] as num).toInt(),
      user: SipReportUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SipReportModelImplToJson(
  _$SipReportModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'image': instance.image,
  'link': instance.link,
  'approved': instance.approved,
  'uid': instance.uid,
  'user': instance.user,
};
