import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';

import 'network_service_interceptor.dart';

final networkServiceProvider = Provider<Dio>((ref) {
  final options = BaseOptions(
    baseUrl: 'https://api.example.com',
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
    sendTimeout: const Duration(seconds: 60),
  );

  final dio = Dio(options);
  final provider = ref.watch(networkServiceInterceptorProvider);
  dio.interceptors.addAll(
    [
      HttpFormatter(),
      provider,
    ]
  );

  return dio;
});