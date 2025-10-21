// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SignUpState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool? get isSuccess => throw _privateConstructorUsedError;
  bool? get isFailure => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  Map<String, dynamic>? get signUpForm => throw _privateConstructorUsedError;
  int get stage => throw _privateConstructorUsedError;
  String? get enteredCode => throw _privateConstructorUsedError;
  int get resendCooldownSeconds => throw _privateConstructorUsedError;
  bool get isVerifying => throw _privateConstructorUsedError;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignUpStateCopyWith<SignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
    SignUpState value,
    $Res Function(SignUpState) then,
  ) = _$SignUpStateCopyWithImpl<$Res, SignUpState>;
  @useResult
  $Res call({
    bool isLoading,
    bool? isSuccess,
    bool? isFailure,
    String? errorMessage,
    Map<String, dynamic>? signUpForm,
    int stage,
    String? enteredCode,
    int resendCooldownSeconds,
    bool isVerifying,
  });
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res, $Val extends SignUpState>
    implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = freezed,
    Object? isFailure = freezed,
    Object? errorMessage = freezed,
    Object? signUpForm = freezed,
    Object? stage = null,
    Object? enteredCode = freezed,
    Object? resendCooldownSeconds = null,
    Object? isVerifying = null,
  }) {
    return _then(
      _value.copyWith(
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            isSuccess: freezed == isSuccess
                ? _value.isSuccess
                : isSuccess // ignore: cast_nullable_to_non_nullable
                      as bool?,
            isFailure: freezed == isFailure
                ? _value.isFailure
                : isFailure // ignore: cast_nullable_to_non_nullable
                      as bool?,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            signUpForm: freezed == signUpForm
                ? _value.signUpForm
                : signUpForm // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            stage: null == stage
                ? _value.stage
                : stage // ignore: cast_nullable_to_non_nullable
                      as int,
            enteredCode: freezed == enteredCode
                ? _value.enteredCode
                : enteredCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            resendCooldownSeconds: null == resendCooldownSeconds
                ? _value.resendCooldownSeconds
                : resendCooldownSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
            isVerifying: null == isVerifying
                ? _value.isVerifying
                : isVerifying // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SignUpStateImplCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$$SignUpStateImplCopyWith(
    _$SignUpStateImpl value,
    $Res Function(_$SignUpStateImpl) then,
  ) = __$$SignUpStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    bool? isSuccess,
    bool? isFailure,
    String? errorMessage,
    Map<String, dynamic>? signUpForm,
    int stage,
    String? enteredCode,
    int resendCooldownSeconds,
    bool isVerifying,
  });
}

/// @nodoc
class __$$SignUpStateImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$SignUpStateImpl>
    implements _$$SignUpStateImplCopyWith<$Res> {
  __$$SignUpStateImplCopyWithImpl(
    _$SignUpStateImpl _value,
    $Res Function(_$SignUpStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = freezed,
    Object? isFailure = freezed,
    Object? errorMessage = freezed,
    Object? signUpForm = freezed,
    Object? stage = null,
    Object? enteredCode = freezed,
    Object? resendCooldownSeconds = null,
    Object? isVerifying = null,
  }) {
    return _then(
      _$SignUpStateImpl(
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        isSuccess: freezed == isSuccess
            ? _value.isSuccess
            : isSuccess // ignore: cast_nullable_to_non_nullable
                  as bool?,
        isFailure: freezed == isFailure
            ? _value.isFailure
            : isFailure // ignore: cast_nullable_to_non_nullable
                  as bool?,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        signUpForm: freezed == signUpForm
            ? _value._signUpForm
            : signUpForm // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        stage: null == stage
            ? _value.stage
            : stage // ignore: cast_nullable_to_non_nullable
                  as int,
        enteredCode: freezed == enteredCode
            ? _value.enteredCode
            : enteredCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        resendCooldownSeconds: null == resendCooldownSeconds
            ? _value.resendCooldownSeconds
            : resendCooldownSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        isVerifying: null == isVerifying
            ? _value.isVerifying
            : isVerifying // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$SignUpStateImpl implements _SignUpState {
  _$SignUpStateImpl({
    this.isLoading = false,
    this.isSuccess,
    this.isFailure,
    this.errorMessage,
    final Map<String, dynamic>? signUpForm = const {},
    this.stage = 1,
    this.enteredCode,
    this.resendCooldownSeconds = 0,
    this.isVerifying = false,
  }) : _signUpForm = signUpForm;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final bool? isSuccess;
  @override
  final bool? isFailure;
  @override
  final String? errorMessage;
  final Map<String, dynamic>? _signUpForm;
  @override
  @JsonKey()
  Map<String, dynamic>? get signUpForm {
    final value = _signUpForm;
    if (value == null) return null;
    if (_signUpForm is EqualUnmodifiableMapView) return _signUpForm;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  final int stage;
  @override
  final String? enteredCode;
  @override
  @JsonKey()
  final int resendCooldownSeconds;
  @override
  @JsonKey()
  final bool isVerifying;

  @override
  String toString() {
    return 'SignUpState(isLoading: $isLoading, isSuccess: $isSuccess, isFailure: $isFailure, errorMessage: $errorMessage, signUpForm: $signUpForm, stage: $stage, enteredCode: $enteredCode, resendCooldownSeconds: $resendCooldownSeconds, isVerifying: $isVerifying)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isFailure, isFailure) ||
                other.isFailure == isFailure) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(
              other._signUpForm,
              _signUpForm,
            ) &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.enteredCode, enteredCode) ||
                other.enteredCode == enteredCode) &&
            (identical(other.resendCooldownSeconds, resendCooldownSeconds) ||
                other.resendCooldownSeconds == resendCooldownSeconds) &&
            (identical(other.isVerifying, isVerifying) ||
                other.isVerifying == isVerifying));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    isSuccess,
    isFailure,
    errorMessage,
    const DeepCollectionEquality().hash(_signUpForm),
    stage,
    enteredCode,
    resendCooldownSeconds,
    isVerifying,
  );

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpStateImplCopyWith<_$SignUpStateImpl> get copyWith =>
      __$$SignUpStateImplCopyWithImpl<_$SignUpStateImpl>(this, _$identity);
}

abstract class _SignUpState implements SignUpState {
  factory _SignUpState({
    final bool isLoading,
    final bool? isSuccess,
    final bool? isFailure,
    final String? errorMessage,
    final Map<String, dynamic>? signUpForm,
    final int stage,
    final String? enteredCode,
    final int resendCooldownSeconds,
    final bool isVerifying,
  }) = _$SignUpStateImpl;

  @override
  bool get isLoading;
  @override
  bool? get isSuccess;
  @override
  bool? get isFailure;
  @override
  String? get errorMessage;
  @override
  Map<String, dynamic>? get signUpForm;
  @override
  int get stage;
  @override
  String? get enteredCode;
  @override
  int get resendCooldownSeconds;
  @override
  bool get isVerifying;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpStateImplCopyWith<_$SignUpStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
