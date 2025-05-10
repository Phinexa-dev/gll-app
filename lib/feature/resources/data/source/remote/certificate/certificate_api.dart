import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../../core/data/remote/network_service.dart';
import '../../../dto/response/certificate/certificate_response.dart';

part 'certificate_api.g.dart';

final certificateApiProvider = Provider<CertificateApi>((ref) {
  final dio = ref.watch(networkServiceProvider);
  return CertificateApi(dio);
});

@RestApi()
@Header('Content-Type : application/json')
abstract class CertificateApi {
  factory CertificateApi(Dio dio) = _CertificateApi;

  @GET('/user-certificate/mycerts')
  Future<List<CertificateResponse>> getCertificates();
}
