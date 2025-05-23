import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'network_service_interceptor.dart';

final networkServiceProvider = Provider<Dio>((ref) {
  final options = BaseOptions(
    baseUrl: dotenv.get('BASE_URL'),
    contentType: 'application/json',
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
    sendTimeout: const Duration(seconds: 60),
  );

  final dio = Dio(options);
  final provider = ref.watch(networkServiceInterceptorProvider(dio));
  dio.interceptors.addAll(
    [
      provider,
    ]
  );

  if (dotenv.get('LOGGING_ENABLED', fallback: 'false') == 'true') {
    dio.interceptors.add(
      HttpFormatter(
        loggingFilter: (request, response, error) => true,
      ),
    );
  }

  return dio;
});