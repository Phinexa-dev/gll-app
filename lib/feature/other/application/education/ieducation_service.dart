import 'package:gll/feature/other/domain/model/education/education_data_model.dart';
import '../../data/dto/request/education/add_education/add_education_request.dart';
import '../../data/dto/request/education/update_education/update_education_data_request.dart';

abstract interface class IEducationService {

  Future<List<EducationDataModel>> getEducations();

  Future<bool> addEducation(AddEducationRequest data);

  Future<bool> updateEducation(UpdateEducationDataRequest data, int educationDataId);

  Future<bool> deleteEducation(int educationDataId);

}