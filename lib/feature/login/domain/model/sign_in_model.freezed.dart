// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SignInModel {
  String get accessToken => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;

  /// Create a copy of SignInModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignInModelCopyWith<SignInModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInModelCopyWith<$Res> {
  factory $SignInModelCopyWith(
    SignInModel value,
    $Res Function(SignInModel) then,
  ) = _$SignInModelCopyWithImpl<$Res, SignInModel>;
  @useResult
  $Res call({
    String accessToken,
    int id,
    String name,
    String email,
    bool success,
  });
}

/// @nodoc
class _$SignInModelCopyWithImpl<$Res, $Val extends SignInModel>
    implements $SignInModelCopyWith<$Res> {
  _$SignInModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignInModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? success = null,
  }) {
    return _then(
      _value.copyWith(
            accessToken: null == accessToken
                ? _value.accessToken
                : accessToken // ignore: cast_nullable_to_non_nullable
                      as String,
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SignInModelImplCopyWith<$Res>
    implements $SignInModelCopyWith<$Res> {
  factory _$$SignInModelImplCopyWith(
    _$SignInModelImpl value,
    $Res Function(_$SignInModelImpl) then,
  ) = __$$SignInModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String accessToken,
    int id,
    String name,
    String email,
    bool success,
  });
}

/// @nodoc
class __$$SignInModelImplCopyWithImpl<$Res>
    extends _$SignInModelCopyWithImpl<$Res, _$SignInModelImpl>
    implements _$$SignInModelImplCopyWith<$Res> {
  __$$SignInModelImplCopyWithImpl(
    _$SignInModelImpl _value,
    $Res Function(_$SignInModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SignInModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? success = null,
  }) {
    return _then(
      _$SignInModelImpl(
        accessToken: null == accessToken
            ? _value.accessToken
            : accessToken // ignore: cast_nullable_to_non_nullable
                  as String,
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$SignInModelImpl implements _SignInModel {
  _$SignInModelImpl({
    required this.accessToken,
    required this.id,
    required this.name,
    required this.email,
    required this.success,
  });

  @override
  final String accessToken;
  @override
  final int id;
  @override
  final String name;
  @override
  final String email;
  @override
  final bool success;

  @override
  String toString() {
    return 'SignInModel(accessToken: $accessToken, id: $id, name: $name, email: $email, success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInModelImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.success, success) || other.success == success));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, id, name, email, success);

  /// Create a copy of SignInModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInModelImplCopyWith<_$SignInModelImpl> get copyWith =>
      __$$SignInModelImplCopyWithImpl<_$SignInModelImpl>(this, _$identity);
}

abstract class _SignInModel implements SignInModel {
  factory _SignInModel({
    required final String accessToken,
    required final int id,
    required final String name,
    required final String email,
    required final bool success,
  }) = _$SignInModelImpl;

  @override
  String get accessToken;
  @override
  int get id;
  @override
  String get name;
  @override
  String get email;
  @override
  bool get success;

  /// Create a copy of SignInModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInModelImplCopyWith<_$SignInModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
