// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'certificate_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CertificateResponse _$CertificateResponseFromJson(Map<String, dynamic> json) {
  return _CertificateResponse.fromJson(json);
}

/// @nodoc
mixin _$CertificateResponse {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get organization => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this CertificateResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CertificateResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CertificateResponseCopyWith<CertificateResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CertificateResponseCopyWith<$Res> {
  factory $CertificateResponseCopyWith(
    CertificateResponse value,
    $Res Function(CertificateResponse) then,
  ) = _$CertificateResponseCopyWithImpl<$Res, CertificateResponse>;
  @useResult
  $Res call({int id, String name, String organization, String description});
}

/// @nodoc
class _$CertificateResponseCopyWithImpl<$Res, $Val extends CertificateResponse>
    implements $CertificateResponseCopyWith<$Res> {
  _$CertificateResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CertificateResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? organization = null,
    Object? description = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            organization: null == organization
                ? _value.organization
                : organization // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CertificateResponseImplCopyWith<$Res>
    implements $CertificateResponseCopyWith<$Res> {
  factory _$$CertificateResponseImplCopyWith(
    _$CertificateResponseImpl value,
    $Res Function(_$CertificateResponseImpl) then,
  ) = __$$CertificateResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String organization, String description});
}

/// @nodoc
class __$$CertificateResponseImplCopyWithImpl<$Res>
    extends _$CertificateResponseCopyWithImpl<$Res, _$CertificateResponseImpl>
    implements _$$CertificateResponseImplCopyWith<$Res> {
  __$$CertificateResponseImplCopyWithImpl(
    _$CertificateResponseImpl _value,
    $Res Function(_$CertificateResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CertificateResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? organization = null,
    Object? description = null,
  }) {
    return _then(
      _$CertificateResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        organization: null == organization
            ? _value.organization
            : organization // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CertificateResponseImpl implements _CertificateResponse {
  const _$CertificateResponseImpl({
    required this.id,
    required this.name,
    required this.organization,
    required this.description,
  });

  factory _$CertificateResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CertificateResponseImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String organization;
  @override
  final String description;

  @override
  String toString() {
    return 'CertificateResponse(id: $id, name: $name, organization: $organization, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CertificateResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.organization, organization) ||
                other.organization == organization) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, organization, description);

  /// Create a copy of CertificateResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CertificateResponseImplCopyWith<_$CertificateResponseImpl> get copyWith =>
      __$$CertificateResponseImplCopyWithImpl<_$CertificateResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CertificateResponseImplToJson(this);
  }
}

abstract class _CertificateResponse implements CertificateResponse {
  const factory _CertificateResponse({
    required final int id,
    required final String name,
    required final String organization,
    required final String description,
  }) = _$CertificateResponseImpl;

  factory _CertificateResponse.fromJson(Map<String, dynamic> json) =
      _$CertificateResponseImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get organization;
  @override
  String get description;

  /// Create a copy of CertificateResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CertificateResponseImplCopyWith<_$CertificateResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
