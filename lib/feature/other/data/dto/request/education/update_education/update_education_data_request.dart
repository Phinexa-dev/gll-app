import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_education_data_request.freezed.dart';
part 'update_education_data_request.g.dart';

@freezed
class UpdateEducationDataRequest with _$UpdateEducationDataRequest {
  const factory UpdateEducationDataRequest({
    @JsonKey(name: "school")
    String? school,
    @JsonKey(name: "degree")
    String? degree,
    @JsonKey(name: "startdate")
    DateTime? startdate,
    @JsonKey(name: "enddate")
    DateTime? enddate,
  }) = _UpdateEducationDataRequest;

  factory UpdateEducationDataRequest.fromJson(Map<String, dynamic> json) => _$UpdateEducationDataRequestFromJson(json);
}
