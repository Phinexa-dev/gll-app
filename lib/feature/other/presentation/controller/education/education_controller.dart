import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/other/application/education/education_service.dart';
import 'package:gll/feature/other/data/dto/request/education/add_education/add_education_request.dart';
import 'package:gll/feature/other/data/dto/request/education/update_education/update_education_data_request.dart';
import 'package:gll/feature/other/presentation/state/educaation/education_state.dart';
import 'package:intl/intl.dart';
import '../../../../system_feedback/model/feedback.dart';
import '../../../../system_feedback/provider/feedback_provider.dart';

final educationControllerProvider = AutoDisposeNotifierProvider<EducationController, EducationState>(EducationController.new);

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
    print(state.form);
    final String school = state.form?['school']?? '';
    final String degree = state.form?['degree']?? '';
    final String startDateString = state.form?['startDate']?? '';
    final String endDateString = state.form?['endDate']?? '';

    if (school.isEmpty || degree.isEmpty || startDateString.isEmpty || endDateString.isEmpty) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        errorMessage: 'Please fill all fields',
      );
      final feedBackService = ref.read(feedbackServiceProvider);
      feedBackService.showToast("Please fill all fields", type: FeedbackType.error);
      return;
    }

    try{

      state = state.copyWith(
        isLoading: true,
        isSuccess: null,
        isFailure: null,
      );

      DateTime startDate = DateFormat('yyyy-MM-dd').parse(startDateString);
      DateTime endDate = DateFormat('yyyy-MM-dd').parse(endDateString);

      final addEducationDataRequest = AddEducationRequest(
          school: school,
          degree: degree,
          startdate: startDate.toUtc(),
          enddate: endDate.toUtc(),
      );

      final result = await ref.read(educationServiceProvider).addEducation(addEducationDataRequest);

      if (result) {
        state = state.copyWith(
          isLoading: false,
          isFailure: false,
          isSuccess: null,
          form: {},
        );

        await getEducationData();
        final feedBackService = ref.read(feedbackServiceProvider);
        feedBackService.showToast("Added an education history", type: FeedbackType.success);
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
    final startDateString = state.form?['startDate'];
    final endDateString = state.form?['endDate'];

    if (school == null || degree == null || startDateString == null || endDateString == null) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        errorMessage: 'Please fill all fields',
      );
      final feedBackService = ref.read(feedbackServiceProvider);
      feedBackService.showToast("Please fill all fields", type: FeedbackType.error);
      return;
    }

    try{

      state = state.copyWith(
        isLoading: true,
        isSuccess: null,
        isFailure: null,
      );

      DateTime startDate = DateFormat('yyyy-MM-dd').parse(startDateString);
      DateTime endDate = DateFormat('yyyy-MM-dd').parse(endDateString);

      final updateEducationDataRequest = UpdateEducationDataRequest(
          school: school,
          degree: degree,
          startdate: startDate.toUtc(),
          enddate: endDate.toUtc(),
      );

      final result = await ref.read(educationServiceProvider).updateEducation(updateEducationDataRequest, educationDataId);

      if (result) {
        state = state.copyWith(
          isLoading: false,
          isFailure: false,
          isSuccess: null,
          form: {},
        );

        final feedBackService = ref.read(feedbackServiceProvider);
        feedBackService.showToast("Updated an education history", type: FeedbackType.success);
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
      final feedBackService = ref.read(feedbackServiceProvider);
      feedBackService.showToast(e.response?.statusMessage?? 'An error occurred', type: FeedbackType.error);
    }
  }

  Future<void> deleteEducationData(int educationDataId) async {

    final feedBackService = ref.read(feedbackServiceProvider);
    try{

      state = state.copyWith(
        isLoading: true,
        isSuccess: null,
        isFailure: null,
      );

      final result = await ref.read(educationServiceProvider).deleteEducation(educationDataId);

      if(result){
        state = state.copyWith(
          isLoading: false,
          isFailure: false,
          isSuccess: null,
        );

        feedBackService.showToast("Deleted an education history", type: FeedbackType.success);
        await getEducationData();
      }
      else{
        state = state.copyWith(
          isLoading: false,
          isSuccess: false,
          isFailure: true,
          errorMessage: 'An error occurred',
        );
        feedBackService.showToast("An error occurred", type: FeedbackType.error);
      }
    }
    on DioException catch(e){
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        errorMessage: e.response?.statusMessage?? 'An error occurred',
      );
      feedBackService.showToast(e.response?.statusMessage?? 'An error occurred', type: FeedbackType.error);
    }
  }

  void setFormData(Map<String, dynamic> formData) {
    state = state.copyWith(
      form: formData,
    );
  }

}