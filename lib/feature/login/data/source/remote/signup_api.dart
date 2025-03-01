import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/core/data/remote/network_service.dart';
import 'package:gll/feature/login/data/dto/request/sign_up_request.dart';
import 'package:gll/feature/login/data/dto/response/sign_up_response.dart';
import 'package:retrofit/retrofit.dart';
part 'signup_api.g.dart';

final signUpApiProvider = Provider<SignupApi>((ref) {
  final Dio dio = ref.watch(networkServiceProvider);
  return SignupApi(dio);
});

@RestApi()
abstract class SignupApi {
  factory SignupApi(Dio dio) => _SignupApi(dio);

  @POST('/auth/signup')
  Future<SignUpResponse> signUp(@Body() SignUpRequest data);
}