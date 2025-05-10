import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/core/data/remote/network_service.dart';
import 'package:retrofit/retrofit.dart';

import '../../dto/request/forgot_password_request.dart';
import '../../dto/response/forgot_password_response.dart';

part 'forgot_password_api.g.dart';

final forgotPasswordApiProvider = Provider<ForgotPasswordApi>((ref) {
  final Dio dio = ref.watch(networkServiceProvider);
  return ForgotPasswordApi(dio);
});

@RestApi()
@Header('Content-Type : application/json')
abstract class ForgotPasswordApi {
  factory ForgotPasswordApi(Dio dio) => _ForgotPasswordApi(dio);

  @POST('/auth/forgot-password')
  Future<ForgotPasswordResponse> forgotPassword(@Body() ForgotPasswordRequest request);
}
