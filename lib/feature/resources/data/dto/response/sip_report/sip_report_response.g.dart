// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sip_report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SipReportResponseImpl _$$SipReportResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SipReportResponseImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      link: json['link'] as String?,
      approved: (json['approved'] as num).toInt(),
      uid: (json['uid'] as num).toInt(),
    );

Map<String, dynamic> _$$SipReportResponseImplToJson(
        _$SipReportResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'link': instance.link,
      'approved': instance.approved,
      'uid': instance.uid,
    };
