import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/core/data/local/secure_storage/Isecure_storage.dart';
import 'package:gll/core/data/local/secure_storage/secure_storage_const.dart';
import '../local/secure_storage/secure_storage.dart';

final networkServiceInterceptorProvider = Provider<NetworkServiceInterceptor>((ref) {
  final secureStorage = ref.watch(secureStorageProvider);
  return NetworkServiceInterceptor(secureStorage);
});

final class NetworkServiceInterceptor extends Interceptor {
  // when want to refresh token when access token expired
  // final Dio _dio;
  final ISecureStorage _secureStorage;

  NetworkServiceInterceptor(this._secureStorage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await _secureStorage.read(key: accessTokenKey);

    options.headers['Content-type'] = 'application/json';
    options.headers['Accept'] = 'application/json';
    options.headers['Authorization'] = 'Bearer $accessToken';

    super.onRequest(options, handler);
  }
}