// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sip_report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SipReportUserResponseImpl _$$SipReportUserResponseImplFromJson(
  Map<String, dynamic> json,
) => _$SipReportUserResponseImpl(
  id: (json['id'] as num).toInt(),
  fullName: json['fullName'] as String,
  email: json['email'] as String,
);

Map<String, dynamic> _$$SipReportUserResponseImplToJson(
  _$SipReportUserResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'fullName': instance.fullName,
  'email': instance.email,
};

_$SipReportResponseImpl _$$SipReportResponseImplFromJson(
  Map<String, dynamic> json,
) => _$SipReportResponseImpl(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
  image: json['image'] as String,
  link: json['link'] as String?,
  approved: (json['approved'] as num).toInt(),
  uid: (json['uid'] as num).toInt(),
  user: SipReportUserResponse.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$SipReportResponseImplToJson(
  _$SipReportResponseImpl instance,
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
