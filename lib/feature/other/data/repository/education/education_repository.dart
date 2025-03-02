import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/other/data/dto/request/education/add_education/add_education_request.dart';
import 'package:gll/feature/other/data/dto/request/education/update_education/update_education_data_request.dart';
import 'package:gll/feature/other/data/dto/response/education/education_data_response.dart';
import 'package:gll/feature/other/data/source/remote/education/manage_education_data_api.dart';
import 'ieducation_repository.dart';

final educationRepositoryProvider = Provider<IEducationRepository>((ref) {
  final ManageEducationDataApi manageEducationDataApi = ref.watch(manageEducationDataApiProvider);
  return EducationRepository(manageEducationDataApi);
});

final class EducationRepository implements IEducationRepository {
  final ManageEducationDataApi _manageEducationDataApi;

  EducationRepository(this._manageEducationDataApi);

  @override
  Future<EducationDataResponse> addEducation(AddEducationRequest data) async {
    try {

      final response = await _manageEducationDataApi.addEducationData(data);
      return response;

    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<EducationDataResponse> deleteEducation(int educationDataId) async {
    try {

      final response = await _manageEducationDataApi.deleteEducationData(educationDataId);
      return response;

    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<EducationDataResponse>> getEducation() async {
    try {

      final response = await _manageEducationDataApi.getEducationData();
      return response;

    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<EducationDataResponse> updateEducation(UpdateEducationDataRequest data, int educationDataId) async {
    try {

      final response = await _manageEducationDataApi.editEducationData(data, educationDataId);
      return response;

    } on DioException catch (_) {
      rethrow;
    }
  }
}