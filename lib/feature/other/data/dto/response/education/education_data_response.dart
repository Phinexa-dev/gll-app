import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'education_data_response.freezed.dart';
part 'education_data_response.g.dart';

@freezed
class EducationDataResponse with _$EducationDataResponse {
  const factory EducationDataResponse({
    @JsonKey(name: "id")
    required int id,
    @JsonKey(name: "uid")
    required int uid,
    @JsonKey(name: "school")
    required String school,
    @JsonKey(name: "degree")
    required String degree,
    @JsonKey(name: "startdate")
    required DateTime startdate,
    @JsonKey(name: "enddate")
    required DateTime enddate,
  }) = _EducationDataResponse;

  factory EducationDataResponse.fromJson(Map<String, dynamic> json) => _$EducationDataResponseFromJson(json);
}
