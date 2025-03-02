import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'add_education_request.freezed.dart';
part 'add_education_request.g.dart';

@freezed
class AddEducationRequest with _$AddEducationRequest {
  const factory AddEducationRequest({
    @JsonKey(name: "school")
    required String school,
    @JsonKey(name: "degree")
    required String degree,
    @JsonKey(name: "startdate")
    required DateTime startdate,
    @JsonKey(name: "enddate")
    required DateTime enddate,
  }) = _AddEducationRequest;

  factory AddEducationRequest.fromJson(Map<String, dynamic> json) => _$AddEducationRequestFromJson(json);
}
