import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/core/data/local/secure_storage/Isecure_storage.dart';
import 'package:gll/core/data/remote/token/itoken_service.dart';
import '../../../../common/dtos/refresh_token_response.dart';
import '../../../../common/http_status/status_code.dart';
import '../../local/secure_storage/secure_storage.dart';
import '../../local/secure_storage/secure_storage_const.dart';

final tokenServiceProvider = Provider.family<ITokenService, Dio>((ref, dio) {
  final secureStorage = ref.watch(secureStorageProvider);

  return TokenService(dio, secureStorage);
});

class TokenService implements ITokenService {
  final Dio _dio;
  final ISecureStorage _secureStorage;

  TokenService(this._dio, this._secureStorage);

  @override
  Future<bool> hasToken() async {
    final accessToken = await _secureStorage.read(key: accessTokenKey);
    final refreshToken = await _secureStorage.read(key: refreshTokenKey);

    return accessToken != null && refreshToken != null;
  }

  @override
  Future<void> clearTokens() {
    return Future.wait([
      _secureStorage.delete(key: accessTokenKey),
      _secureStorage.delete(key: refreshTokenKey),
    ]);
  }

  @override
  Future<String?> getAccessToken() => _secureStorage.read(key: accessTokenKey);

  @override
  Future<String?> getRefreshToken() => _secureStorage.read(key: refreshTokenKey);

  @override
  Future<RefreshTokenResponse> refreshToken(String? refreshToken) async {
    final response =  await _dio.post<Map<String, dynamic>>(
      '/refresh_token',
      data: {
        'refreshToken': refreshToken,
      },
    );

    if (response.statusCode == success) {
      return RefreshTokenResponse.fromJson(response.data?? {});
    }
    else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<void> saveTokens(String accessToken, String refreshToken) {
    return Future.wait([
      _secureStorage.write(key: accessTokenKey, value: accessToken),
      _secureStorage.write(key: refreshTokenKey, value: refreshToken),
    ]);
  }
}