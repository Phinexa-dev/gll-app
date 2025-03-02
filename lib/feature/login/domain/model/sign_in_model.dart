import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_model.freezed.dart';

@freezed
class SignInModel with _$SignInModel {
  factory SignInModel({
    required String accessToken,
    required int id,
    required String name,
    required String email,
    required bool success,
}) = _SignInModel;
}