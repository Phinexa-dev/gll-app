import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gll/feature/other/domain/model/education/education_data_model.dart';

part 'education_state.freezed.dart';

@freezed
class EducationState with _$EducationState {

  factory EducationState({
    @Default(false) bool isLoading,
    bool? isSuccess,
    bool? isFailure,
    String? errorMessage,
    @Default({}) Map<String, dynamic>? form,
    @Default([]) List<EducationDataModel> educationData,
  }) = _EducationState;
}
