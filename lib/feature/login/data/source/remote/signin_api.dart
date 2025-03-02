import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/core/data/remote/network_service.dart';
import 'package:retrofit/retrofit.dart';
import '../../dto/request/sign_in_request.dart';
import '../../dto/response/sign_in_response.dart';
part 'signin_api.g.dart';

final signInApiProvider = Provider<SignInApi>((ref) {
  final Dio dio = ref.watch(networkServiceProvider);
  return SignInApi(dio);
});

@RestApi()
@Header('Content-Type : application/json')
abstract class SignInApi {
  factory SignInApi(Dio dio) => _SignInApi(dio);

  @POST('/auth/login')
  Future<SignInResponse> signIn(@Body() SignInRequest data);
}