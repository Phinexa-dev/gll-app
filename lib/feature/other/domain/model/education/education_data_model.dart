import 'package:freezed_annotation/freezed_annotation.dart';

part 'education_data_model.freezed.dart';

@freezed
class EducationDataModel with _$EducationDataModel {
  const factory EducationDataModel({
    required int id,
    required String school,
    required String degree,
    required DateTime startdate,
    required DateTime enddate,
  }) = _EducationDataModel;
}
