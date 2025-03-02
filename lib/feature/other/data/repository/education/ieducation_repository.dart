import 'package:gll/feature/other/data/dto/request/education/add_education/add_education_request.dart';
import 'package:gll/feature/other/data/dto/request/education/update_education/update_education_data_request.dart';
import '../../dto/response/education/education_data_response.dart';

abstract interface class IEducationRepository {

  Future<List<EducationDataResponse>> getEducation();

  Future<EducationDataResponse> addEducation(AddEducationRequest data);

  Future<EducationDataResponse> updateEducation(UpdateEducationDataRequest data, int educationDataId);

  Future<EducationDataResponse> deleteEducation(int educationDataId);

}