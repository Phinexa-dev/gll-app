import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/dto/request/sign_up_request.dart';
import '../data/repository/isign_up_repository.dart';
import '../data/repository/sign_up_repository.dart';
import 'isign_up_service.dart';

final signUpServiceProvider = Provider<ISignUpService>((ref) {
  final ISignUpRepository signUpRepository = ref.watch(signUpRepositoryProvider);
  return SignUpService(signUpRepository);
});

final class SignUpService implements ISignUpService {
  final ISignUpRepository _signUpRepository;

  SignUpService(this._signUpRepository);

  @override
  Future<bool> signUp(SignUpRequest signUpRequest) async {
    try {
      await _signUpRepository.signUp(signUpRequest);
      return true;
    } on DioException catch (_) {
      rethrow;
    }
  }
}