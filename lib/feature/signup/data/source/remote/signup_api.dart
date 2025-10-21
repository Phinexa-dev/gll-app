import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/core/data/remote/network_service.dart';
import 'package:retrofit/retrofit.dart';
import '../../dto/request/sign_up_request.dart';
import '../../dto/response/sign_up_response.dart';
part 'signup_api.g.dart';

final signUpApiProvider = Provider<SignupApi>((ref) {
  final Dio dio = ref.watch(networkServiceProvider);
  return SignupApi(dio);
});

@RestApi()
@Header('Content-Type : application/json')
abstract class SignupApi {
  factory SignupApi(Dio dio) => _SignupApi(dio);

  @POST('/auth/signup')
  Future<SignUpResponse> signUp(@Body() SignUpRequest data);

  @POST('/auth/code/send')
  Future<void> sendVerificationCode(@Body() Map<String, dynamic> data);

  @POST('/auth/code/verify')
  Future<dynamic> verifyCode(@Body() Map<String, dynamic> data);
}
