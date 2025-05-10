import 'package:freezed_annotation/freezed_annotation.dart';

part 'certificate_model.freezed.dart';

@freezed
class CertificateModel with _$CertificateModel {
  factory CertificateModel({
    required int id,
    required String name,
    required String organization,
    required String description,
  }) = _CertificateModel;
} 