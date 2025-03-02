import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/core/data/remote/network_service.dart';
import 'package:gll/feature/other/data/dto/request/education/add_education/add_education_request.dart';
import 'package:gll/feature/other/data/dto/request/education/update_education/update_education_data_request.dart';
import 'package:gll/feature/other/data/dto/response/education/education_data_response.dart';
import 'package:retrofit/retrofit.dart';

part 'manage_education_data_api.g.dart';

final manageEducationDataApiProvider = Provider<ManageEducationDataApi>((ref) {
  final Dio dio = ref.watch(networkServiceProvider);
  return ManageEducationDataApi(dio);
});

@RestApi()
@Header('Content-Type : application/json')
abstract class ManageEducationDataApi {
  factory ManageEducationDataApi(Dio dio) => _ManageEducationDataApi(dio);

  @GET('/education')
  Future<List<EducationDataResponse>> getEducationData();

  @POST('/education')
  Future<EducationDataResponse> addEducationData(@Body() AddEducationRequest data);

  @PATCH('/education/{id}')
  Future<EducationDataResponse> editEducationData(@Body() UpdateEducationDataRequest data, @Path('id') int educationDataId);

  @DELETE('/education/{id}')
  Future<EducationDataResponse> deleteEducationData(@Path('id') int educationDataId);
}