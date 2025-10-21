import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/event/data/dto/request/survey_request.dart';
import 'package:gll/feature/event/data/repository/survey/isurvey_repository.dart';
import 'package:gll/feature/event/data/repository/survey/survey_repository.dart';
import 'isurvey_service.dart';

final surveyServiceProvider = Provider<SurveyService>((ref) {
  final surveyRepository = ref.watch(surveyRepositoryProvider);
  return SurveyService(surveyRepository);
});

final class SurveyService implements ISurveyService {
  final ISurveyRepository _surveyRepository;

  SurveyService(this._surveyRepository);

  @override
  Future<bool> submitPreSurvey(int eventId, Map<String, dynamic> surveyData) async {
    try {
      final surveyDataWithTimestamp = {
        ...surveyData,
        'submittedAt': DateTime.now().toIso8601String(),
      };

      final request = PreSurveyRequest(survey: surveyDataWithTimestamp);
      await _surveyRepository.submitPreSurvey(eventId, request);
      return true;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool> submitPostSurvey(int eventId, Map<String, dynamic> surveyData) async {
    try {
      final surveyDataWithTimestamp = {
        ...surveyData,
        'submittedAt': DateTime.now().toIso8601String(),
      };

      final request = PostSurveyRequest(postSurvey: surveyDataWithTimestamp);
      await _surveyRepository.submitPostSurvey(eventId, request);
      return true;
    } on DioException catch (_) {
      rethrow;
    }
  }
}

