import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_code_request.freezed.dart';
part 'send_code_request.g.dart';

@freezed
class SendCodeRequest with _$SendCodeRequest {
  factory SendCodeRequest({
    required String email,
  }) = _SendCodeRequest;

  factory SendCodeRequest.fromJson(Map<String, dynamic> json) => _$SendCodeRequestFromJson(json);
}
