import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/dto/request/sign_in_request.dart';
import '../data/repository/isign_in_repository.dart';
import '../data/repository/sign_in_repository.dart';
import 'isign_in_service.dart';

final signInServiceProvider = Provider<ISignInService>((ref) {
  final ISignInRepository signInRepository = ref.watch(signInRepositoryProvider);
  return SignInService(signInRepository);
});

final class SignInService implements ISignInService {
  final ISignInRepository _signInRepository;

  SignInService(this._signInRepository);

  @override
  Future<bool> signIn(SignInRequest signInRequest) async {
    try {
      await _signInRepository.signIn(signInRequest);
      return true;
    } on DioException catch (_) {
      rethrow;
    }
  }
}