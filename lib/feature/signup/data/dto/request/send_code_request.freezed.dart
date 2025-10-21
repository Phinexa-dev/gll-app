// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_code_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SendCodeRequest _$SendCodeRequestFromJson(Map<String, dynamic> json) {
  return _SendCodeRequest.fromJson(json);
}

/// @nodoc
mixin _$SendCodeRequest {
  String get email => throw _privateConstructorUsedError;

  /// Serializes this SendCodeRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendCodeRequestCopyWith<SendCodeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendCodeRequestCopyWith<$Res> {
  factory $SendCodeRequestCopyWith(
    SendCodeRequest value,
    $Res Function(SendCodeRequest) then,
  ) = _$SendCodeRequestCopyWithImpl<$Res, SendCodeRequest>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$SendCodeRequestCopyWithImpl<$Res, $Val extends SendCodeRequest>
    implements $SendCodeRequestCopyWith<$Res> {
  _$SendCodeRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _value.copyWith(
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SendCodeRequestImplCopyWith<$Res>
    implements $SendCodeRequestCopyWith<$Res> {
  factory _$$SendCodeRequestImplCopyWith(
    _$SendCodeRequestImpl value,
    $Res Function(_$SendCodeRequestImpl) then,
  ) = __$$SendCodeRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$SendCodeRequestImplCopyWithImpl<$Res>
    extends _$SendCodeRequestCopyWithImpl<$Res, _$SendCodeRequestImpl>
    implements _$$SendCodeRequestImplCopyWith<$Res> {
  __$$SendCodeRequestImplCopyWithImpl(
    _$SendCodeRequestImpl _value,
    $Res Function(_$SendCodeRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SendCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _$SendCodeRequestImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SendCodeRequestImpl implements _SendCodeRequest {
  _$SendCodeRequestImpl({required this.email});

  factory _$SendCodeRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendCodeRequestImplFromJson(json);

  @override
  final String email;

  @override
  String toString() {
    return 'SendCodeRequest(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendCodeRequestImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of SendCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendCodeRequestImplCopyWith<_$SendCodeRequestImpl> get copyWith =>
      __$$SendCodeRequestImplCopyWithImpl<_$SendCodeRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SendCodeRequestImplToJson(this);
  }
}

abstract class _SendCodeRequest implements SendCodeRequest {
  factory _SendCodeRequest({required final String email}) =
      _$SendCodeRequestImpl;

  factory _SendCodeRequest.fromJson(Map<String, dynamic> json) =
      _$SendCodeRequestImpl.fromJson;

  @override
  String get email;

  /// Create a copy of SendCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendCodeRequestImplCopyWith<_$SendCodeRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
