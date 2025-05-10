import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/resources/application/sip_report/sip_report_service.dart';
import 'package:gll/feature/resources/data/dto/request/sip_report/upload_sip_report/upload_sip_report_request.dart';
import 'package:gll/feature/resources/presentation/state/sip_report_state.dart';

import '../../../../system_feedback/model/feedback.dart';
import '../../../../system_feedback/provider/feedback_provider.dart';

final sipReportControllerProvider =
AutoDisposeNotifierProvider<SipReportController, SipReportState>(
    SipReportController.new);

class SipReportController extends AutoDisposeNotifier<SipReportState> {
  @override
  SipReportState build() {
    return SipReportState();
  }

  Future<void> getSipReportsData() async {
    try {
      state = state.copyWith(
        isLoading: true,
        isSuccess: null,
        isFailure: null,
      );

      final result = await ref.read(sipReportServiceProvider).getSipReports();

      state = state.copyWith(
        isLoading: false,
        isSuccess: true,
        isFailure: false,
        sipReportsData: result,
      );
    } on DioException catch (e) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        errorMessage: e.response?.statusMessage ?? 'An error occurred',
      );
    }
  }

  Future<void> uploadSipReport() async {
    print(state.form);
    final String title = state.form?['title'] ?? '';
    final String description = state.form?['description'] ?? '';
    final String image = state.form?['image'] ?? '';
    final String link = state.form?['link'] ?? '';

    if (title.isEmpty || description.isEmpty || image.isEmpty) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        errorMessage: 'Please fill all fields',
      );
      final feedBackService = ref.read(feedbackServiceProvider);
      feedBackService.showToast("Please fill all fields",
          type: FeedbackType.error);
      return;
    }

    try {
      state = state.copyWith(
        isLoading: true,
        isSuccess: null,
        isFailure: null,
      );

      final request = UploadSipReportRequest(
        title: title,
        description: description,
        image: image,
        link: link,
      );

      final result = await ref.read(sipReportServiceProvider).uploadSipReport(
          request);

      if (result) {
        state = state.copyWith(
          isLoading: false,
          isFailure: false,
          isSuccess: null,
          form: {},
        );

        await getSipReportsData();
        final feedBackService = ref.read(feedbackServiceProvider);
        feedBackService.showToast("SIP Report Uploaded Successfully",
            type: FeedbackType.success);
      } else {
        state = state.copyWith(
          isLoading: false,
          isSuccess: false,
          isFailure: true,
          errorMessage: 'An error occurred',
        );
      }
    } on DioException catch (e) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        errorMessage: e.response?.statusMessage ?? 'An error occurred',
      );
    }
  }

  void setFormData(Map<String, dynamic> formData) {
    state = state.copyWith(
      form: formData,
    );
  }
}
