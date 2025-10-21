// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sip_report_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SipReportState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool? get isSuccess => throw _privateConstructorUsedError;
  bool? get isFailure => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  Map<String, dynamic>? get form => throw _privateConstructorUsedError;
  List<SipReportModel> get sipReportsData => throw _privateConstructorUsedError;

  /// Create a copy of SipReportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SipReportStateCopyWith<SipReportState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SipReportStateCopyWith<$Res> {
  factory $SipReportStateCopyWith(
    SipReportState value,
    $Res Function(SipReportState) then,
  ) = _$SipReportStateCopyWithImpl<$Res, SipReportState>;
  @useResult
  $Res call({
    bool isLoading,
    bool? isSuccess,
    bool? isFailure,
    String? errorMessage,
    Map<String, dynamic>? form,
    List<SipReportModel> sipReportsData,
  });
}

/// @nodoc
class _$SipReportStateCopyWithImpl<$Res, $Val extends SipReportState>
    implements $SipReportStateCopyWith<$Res> {
  _$SipReportStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SipReportState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = freezed,
    Object? isFailure = freezed,
    Object? errorMessage = freezed,
    Object? form = freezed,
    Object? sipReportsData = null,
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
            form: freezed == form
                ? _value.form
                : form // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            sipReportsData: null == sipReportsData
                ? _value.sipReportsData
                : sipReportsData // ignore: cast_nullable_to_non_nullable
                      as List<SipReportModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SipReportStateImplCopyWith<$Res>
    implements $SipReportStateCopyWith<$Res> {
  factory _$$SipReportStateImplCopyWith(
    _$SipReportStateImpl value,
    $Res Function(_$SipReportStateImpl) then,
  ) = __$$SipReportStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    bool? isSuccess,
    bool? isFailure,
    String? errorMessage,
    Map<String, dynamic>? form,
    List<SipReportModel> sipReportsData,
  });
}

/// @nodoc
class __$$SipReportStateImplCopyWithImpl<$Res>
    extends _$SipReportStateCopyWithImpl<$Res, _$SipReportStateImpl>
    implements _$$SipReportStateImplCopyWith<$Res> {
  __$$SipReportStateImplCopyWithImpl(
    _$SipReportStateImpl _value,
    $Res Function(_$SipReportStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SipReportState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = freezed,
    Object? isFailure = freezed,
    Object? errorMessage = freezed,
    Object? form = freezed,
    Object? sipReportsData = null,
  }) {
    return _then(
      _$SipReportStateImpl(
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
        form: freezed == form
            ? _value._form
            : form // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        sipReportsData: null == sipReportsData
            ? _value._sipReportsData
            : sipReportsData // ignore: cast_nullable_to_non_nullable
                  as List<SipReportModel>,
      ),
    );
  }
}

/// @nodoc

class _$SipReportStateImpl implements _SipReportState {
  _$SipReportStateImpl({
    this.isLoading = false,
    this.isSuccess,
    this.isFailure,
    this.errorMessage,
    final Map<String, dynamic>? form = const {},
    final List<SipReportModel> sipReportsData = const [],
  }) : _form = form,
       _sipReportsData = sipReportsData;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final bool? isSuccess;
  @override
  final bool? isFailure;
  @override
  final String? errorMessage;
  final Map<String, dynamic>? _form;
  @override
  @JsonKey()
  Map<String, dynamic>? get form {
    final value = _form;
    if (value == null) return null;
    if (_form is EqualUnmodifiableMapView) return _form;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<SipReportModel> _sipReportsData;
  @override
  @JsonKey()
  List<SipReportModel> get sipReportsData {
    if (_sipReportsData is EqualUnmodifiableListView) return _sipReportsData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sipReportsData);
  }

  @override
  String toString() {
    return 'SipReportState(isLoading: $isLoading, isSuccess: $isSuccess, isFailure: $isFailure, errorMessage: $errorMessage, form: $form, sipReportsData: $sipReportsData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SipReportStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isFailure, isFailure) ||
                other.isFailure == isFailure) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._form, _form) &&
            const DeepCollectionEquality().equals(
              other._sipReportsData,
              _sipReportsData,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    isSuccess,
    isFailure,
    errorMessage,
    const DeepCollectionEquality().hash(_form),
    const DeepCollectionEquality().hash(_sipReportsData),
  );

  /// Create a copy of SipReportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SipReportStateImplCopyWith<_$SipReportStateImpl> get copyWith =>
      __$$SipReportStateImplCopyWithImpl<_$SipReportStateImpl>(
        this,
        _$identity,
      );
}

abstract class _SipReportState implements SipReportState {
  factory _SipReportState({
    final bool isLoading,
    final bool? isSuccess,
    final bool? isFailure,
    final String? errorMessage,
    final Map<String, dynamic>? form,
    final List<SipReportModel> sipReportsData,
  }) = _$SipReportStateImpl;

  @override
  bool get isLoading;
  @override
  bool? get isSuccess;
  @override
  bool? get isFailure;
  @override
  String? get errorMessage;
  @override
  Map<String, dynamic>? get form;
  @override
  List<SipReportModel> get sipReportsData;

  /// Create a copy of SipReportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SipReportStateImplCopyWith<_$SipReportStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
