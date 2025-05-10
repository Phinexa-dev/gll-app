import 'package:freezed_annotation/freezed_annotation.dart';

part 'certificate_response.freezed.dart';
part 'certificate_response.g.dart';

@freezed
class CertificateResponse with _$CertificateResponse {
  const factory CertificateResponse({
    required int id,
    required String name,
    required String organization,
    required String description,
  }) = _CertificateResponse;

  factory CertificateResponse.fromJson(Map<String, dynamic> json) =>
      _$CertificateResponseFromJson(json);
} 