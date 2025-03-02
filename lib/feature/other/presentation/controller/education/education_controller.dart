import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/other/application/education/education_service.dart';
import 'package:gll/feature/other/data/dto/request/education/add_education/add_education_request.dart';
import 'package:gll/feature/other/data/dto/request/education/update_education/update_education_data_request.dart';
import 'package:gll/feature/other/presentation/state/educaation/education_state.dart';

final profileControllerProvider = AutoDisposeNotifierProvider<EducationController, EducationState>(EducationController.new);

class EducationController extends AutoDisposeNotifier<EducationState> {

  @override
  EducationState build() {
    return EducationState();
  }

  Future<void> getEducationData() async {
    try{

      state = state.copyWith(
        isLoading: true,
        isSuccess: null,
        isFailure: null,
      );

      final result = await ref.read(educationServiceProvider).getEducations();

      state = state.copyWith(
        isLoading: false,
        isSuccess: true,
        isFailure: false,
        educationData: result,
      );

    }
    on DioException catch(e){
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        errorMessage: e.response?.statusMessage?? 'An error occurred',
      );
    }
  }

  Future<void> addEducationData() async {
    final school = state.form?['school'];
    final degree = state.form?['degree'];
    final startDate = state.form?['startdate'];
    final endDate = state.form?['enddate'];

    if (school == null || degree == null || startDate == null || endDate == null) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        errorMessage: 'Please fill all fields',
      );
      return;
    }

    try{

      state = state.copyWith(
        isLoading: true,
        isSuccess: null,
        isFailure: null,
      );

      final addEducationDataRequest = AddEducationRequest(
          school: school,
          degree: degree,
          startdate: startDate,
          enddate: endDate,
      );

      final result = await ref.read(educationServiceProvider).addEducation(addEducationDataRequest);

      if (result) {
        await getEducationData();
      }
      else {
        state = state.copyWith(
          isLoading: false,
          isSuccess: false,
          isFailure: true,
          errorMessage: 'An error occurred',
        );
      }

    }
    on DioException catch(e){
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        errorMessage: e.response?.statusMessage?? 'An error occurred',
      );
    }
  }

  Future<void> editEducationData(int educationDataId) async {
    final school = state.form?['school'];
    final degree = state.form?['degree'];
    final startDate = state.form?['startdate'];
    final endDate = state.form?['enddate'];

    if (school == null || degree == null || startDate == null || endDate == null) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        errorMessage: 'Please fill all fields',
      );
      return;
    }

    try{

      state = state.copyWith(
        isLoading: true,
        isSuccess: null,
        isFailure: null,
      );

      final updateEducationDataRequest = UpdateEducationDataRequest(
          school: school,
          degree: degree,
          startdate: startDate,
          enddate: endDate,
      );

      final result = await ref.read(educationServiceProvider).updateEducation(updateEducationDataRequest, educationDataId);

      if (result) {
        await getEducationData();
      }
      else {
        state = state.copyWith(
          isLoading: false,
          isSuccess: false,
          isFailure: true,
          errorMessage: 'An error occurred',
        );
      }

    }
    on DioException catch(e){
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        errorMessage: e.response?.statusMessage?? 'An error occurred',
      );
    }
  }

  Future<void> deleteEducationData(int educationDataId) async {

    try{

      state = state.copyWith(
        isLoading: true,
        isSuccess: null,
        isFailure: null,
      );

      final result = await ref.read(educationServiceProvider).deleteEducation(educationDataId);

      if(result){
        await getEducationData();
      }
      else{
        state = state.copyWith(
          isLoading: false,
          isSuccess: false,
          isFailure: true,
          errorMessage: 'An error occurred',
        );
      }
    }
    on DioException catch(e){
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        errorMessage: e.response?.statusMessage?? 'An error occurred',
      );
    }
  }

  void setFormData(Map<String, dynamic> formData) {
    state = state.copyWith(
      form: formData,
    );
  }

}