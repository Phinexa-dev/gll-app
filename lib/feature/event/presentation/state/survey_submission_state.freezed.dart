// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'survey_submission_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SurveySubmissionState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isFailure => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of SurveySubmissionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SurveySubmissionStateCopyWith<SurveySubmissionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveySubmissionStateCopyWith<$Res> {
  factory $SurveySubmissionStateCopyWith(
    SurveySubmissionState value,
    $Res Function(SurveySubmissionState) then,
  ) = _$SurveySubmissionStateCopyWithImpl<$Res, SurveySubmissionState>;
  @useResult
  $Res call({
    bool isLoading,
    bool isSuccess,
    bool isFailure,
    String? errorMessage,
  });
}

/// @nodoc
class _$SurveySubmissionStateCopyWithImpl<
  $Res,
  $Val extends SurveySubmissionState
>
    implements $SurveySubmissionStateCopyWith<$Res> {
  _$SurveySubmissionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SurveySubmissionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isFailure = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            isSuccess: null == isSuccess
                ? _value.isSuccess
                : isSuccess // ignore: cast_nullable_to_non_nullable
                      as bool,
            isFailure: null == isFailure
                ? _value.isFailure
                : isFailure // ignore: cast_nullable_to_non_nullable
                      as bool,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SurveySubmissionStateImplCopyWith<$Res>
    implements $SurveySubmissionStateCopyWith<$Res> {
  factory _$$SurveySubmissionStateImplCopyWith(
    _$SurveySubmissionStateImpl value,
    $Res Function(_$SurveySubmissionStateImpl) then,
  ) = __$$SurveySubmissionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    bool isSuccess,
    bool isFailure,
    String? errorMessage,
  });
}

/// @nodoc
class __$$SurveySubmissionStateImplCopyWithImpl<$Res>
    extends
        _$SurveySubmissionStateCopyWithImpl<$Res, _$SurveySubmissionStateImpl>
    implements _$$SurveySubmissionStateImplCopyWith<$Res> {
  __$$SurveySubmissionStateImplCopyWithImpl(
    _$SurveySubmissionStateImpl _value,
    $Res Function(_$SurveySubmissionStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SurveySubmissionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isFailure = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$SurveySubmissionStateImpl(
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        isSuccess: null == isSuccess
            ? _value.isSuccess
            : isSuccess // ignore: cast_nullable_to_non_nullable
                  as bool,
        isFailure: null == isFailure
            ? _value.isFailure
            : isFailure // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$SurveySubmissionStateImpl implements _SurveySubmissionState {
  const _$SurveySubmissionStateImpl({
    this.isLoading = false,
    this.isSuccess = false,
    this.isFailure = false,
    this.errorMessage,
  });

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  @JsonKey()
  final bool isFailure;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'SurveySubmissionState(isLoading: $isLoading, isSuccess: $isSuccess, isFailure: $isFailure, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SurveySubmissionStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isFailure, isFailure) ||
                other.isFailure == isFailure) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, isSuccess, isFailure, errorMessage);

  /// Create a copy of SurveySubmissionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SurveySubmissionStateImplCopyWith<_$SurveySubmissionStateImpl>
  get copyWith =>
      __$$SurveySubmissionStateImplCopyWithImpl<_$SurveySubmissionStateImpl>(
        this,
        _$identity,
      );
}

abstract class _SurveySubmissionState implements SurveySubmissionState {
  const factory _SurveySubmissionState({
    final bool isLoading,
    final bool isSuccess,
    final bool isFailure,
    final String? errorMessage,
  }) = _$SurveySubmissionStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  bool get isFailure;
  @override
  String? get errorMessage;

  /// Create a copy of SurveySubmissionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SurveySubmissionStateImplCopyWith<_$SurveySubmissionStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
