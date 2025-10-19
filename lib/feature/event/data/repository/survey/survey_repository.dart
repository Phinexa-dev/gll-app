import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/event/data/dto/request/survey_request.dart';
import 'package:gll/feature/event/data/dto/response/survey_response.dart';
import 'package:gll/feature/event/data/source/remote/survey/survey_api.dart';
import 'isurvey_repository.dart';

final surveyRepositoryProvider = Provider<ISurveyRepository>((ref) {
  final SurveyApi surveyApi = ref.watch(surveyApiProvider);
  return SurveyRepository(surveyApi);
});

final class SurveyRepository implements ISurveyRepository {
  final SurveyApi _surveyApi;

  SurveyRepository(this._surveyApi);

  @override
  Future<SurveyResponse> submitPreSurvey(int eventId, PreSurveyRequest request) async {
    try {
      final response = await _surveyApi.submitPreSurvey(eventId, request);
      return response;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<SurveyResponse> submitPostSurvey(int eventId, PostSurveyRequest request) async {
    try {
      final response = await _surveyApi.submitPostSurvey(eventId, request);
      return response;
    } on DioException catch (_) {
      rethrow;
    }
  }
}

