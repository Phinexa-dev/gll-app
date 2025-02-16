import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/home/data/survey_grid_repository.dart';

import '../../../data/survey_model.dart';
import '../../../data/survey_repository.dart';

final surveyRepositoryProvider = Provider((ref) => SurveyRepository());
final surveyGridRepositoryProvider = Provider((ref) => SurveyGridRepository());

final surveyProvider = FutureProvider<List<SurveyModel>>((ref) async {
  final repository = ref.read(surveyRepositoryProvider);
  return repository.fetchSurveys();
});

final surveyGridQuestionsProvider = FutureProvider<List<String>>((ref) async {
  final repository = ref.read(surveyGridRepositoryProvider);
  return repository.fetchGridSurveys();
});
