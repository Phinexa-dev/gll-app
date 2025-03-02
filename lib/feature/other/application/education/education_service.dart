import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/other/data/dto/request/education/add_education/add_education_request.dart';
import 'package:gll/feature/other/data/dto/request/education/update_education/update_education_data_request.dart';
import 'package:gll/feature/other/domain/model/education/education_data_model.dart';
import '../../data/dto/response/education/education_data_response.dart';
import '../../data/repository/education/education_repository.dart';
import '../../data/repository/education/ieducation_repository.dart';
import 'ieducation_service.dart';

final educationServiceProvider = Provider<EducationService>((ref) {
  final educationRepository = ref.watch(educationRepositoryProvider);
  return EducationService(educationRepository);
});

final class EducationService implements IEducationService {
  final IEducationRepository _educationRepository;

  EducationService(this._educationRepository);

  @override
  Future<bool> addEducation(AddEducationRequest data) async {
    try {
      final response = await _educationRepository.addEducation(data);

      // final educationDataModel = _mapToEducationDataModel(response);
      return true;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteEducation(int educationDataId) async {
    try {
      final response = await _educationRepository.deleteEducation(educationDataId);

      // final educationDataModel = _mapToEducationDataModel(response);
      return true;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<EducationDataModel>> getEducations() async {
    try {
      final response = await _educationRepository.getEducation();

      final educationsData = response.map((e) => _mapToEducationDataModel(e)).toList();
      return educationsData;

    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool> updateEducation(UpdateEducationDataRequest data, int educationDataId) async {
    try {
      final response = await _educationRepository.updateEducation(data, educationDataId);

      // final educationDataModel = _mapToEducationDataModel(response);
      return true;
    } on DioException catch (_) {
      rethrow;
    }
  }

  EducationDataModel _mapToEducationDataModel(EducationDataResponse educationDataResponse) {
    return EducationDataModel(
      id: educationDataResponse.id,
      school: educationDataResponse.school,
      degree: educationDataResponse.degree,
      startdate: educationDataResponse.startdate,
      enddate: educationDataResponse.enddate,
    );
  }

}