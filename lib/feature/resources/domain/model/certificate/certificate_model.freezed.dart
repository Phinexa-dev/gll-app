// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'certificate_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CertificateModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get organization => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Create a copy of CertificateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CertificateModelCopyWith<CertificateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CertificateModelCopyWith<$Res> {
  factory $CertificateModelCopyWith(
    CertificateModel value,
    $Res Function(CertificateModel) then,
  ) = _$CertificateModelCopyWithImpl<$Res, CertificateModel>;
  @useResult
  $Res call({int id, String name, String organization, String description});
}

/// @nodoc
class _$CertificateModelCopyWithImpl<$Res, $Val extends CertificateModel>
    implements $CertificateModelCopyWith<$Res> {
  _$CertificateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CertificateModel
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
abstract class _$$CertificateModelImplCopyWith<$Res>
    implements $CertificateModelCopyWith<$Res> {
  factory _$$CertificateModelImplCopyWith(
    _$CertificateModelImpl value,
    $Res Function(_$CertificateModelImpl) then,
  ) = __$$CertificateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String organization, String description});
}

/// @nodoc
class __$$CertificateModelImplCopyWithImpl<$Res>
    extends _$CertificateModelCopyWithImpl<$Res, _$CertificateModelImpl>
    implements _$$CertificateModelImplCopyWith<$Res> {
  __$$CertificateModelImplCopyWithImpl(
    _$CertificateModelImpl _value,
    $Res Function(_$CertificateModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CertificateModel
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
      _$CertificateModelImpl(
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

class _$CertificateModelImpl implements _CertificateModel {
  _$CertificateModelImpl({
    required this.id,
    required this.name,
    required this.organization,
    required this.description,
  });

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
    return 'CertificateModel(id: $id, name: $name, organization: $organization, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CertificateModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.organization, organization) ||
                other.organization == organization) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, organization, description);

  /// Create a copy of CertificateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CertificateModelImplCopyWith<_$CertificateModelImpl> get copyWith =>
      __$$CertificateModelImplCopyWithImpl<_$CertificateModelImpl>(
        this,
        _$identity,
      );
}

abstract class _CertificateModel implements CertificateModel {
  factory _CertificateModel({
    required final int id,
    required final String name,
    required final String organization,
    required final String description,
  }) = _$CertificateModelImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  String get organization;
  @override
  String get description;

  /// Create a copy of CertificateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CertificateModelImplCopyWith<_$CertificateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
