// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_sip_report_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UploadSipReportRequestImpl _$$UploadSipReportRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UploadSipReportRequestImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$$UploadSipReportRequestImplToJson(
        _$UploadSipReportRequestImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'link': instance.link,
    };
