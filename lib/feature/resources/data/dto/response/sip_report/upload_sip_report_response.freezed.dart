// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_sip_report_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UploadSipReportResponse _$UploadSipReportResponseFromJson(
  Map<String, dynamic> json,
) {
  return _UploadSipReportResponse.fromJson(json);
}

/// @nodoc
mixin _$UploadSipReportResponse {
  String? get message => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;

  /// Serializes this UploadSipReportResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadSipReportResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadSipReportResponseCopyWith<UploadSipReportResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadSipReportResponseCopyWith<$Res> {
  factory $UploadSipReportResponseCopyWith(
    UploadSipReportResponse value,
    $Res Function(UploadSipReportResponse) then,
  ) = _$UploadSipReportResponseCopyWithImpl<$Res, UploadSipReportResponse>;
  @useResult
  $Res call({String? message, bool? success});
}

/// @nodoc
class _$UploadSipReportResponseCopyWithImpl<
  $Res,
  $Val extends UploadSipReportResponse
>
    implements $UploadSipReportResponseCopyWith<$Res> {
  _$UploadSipReportResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadSipReportResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = freezed, Object? success = freezed}) {
    return _then(
      _value.copyWith(
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
            success: freezed == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UploadSipReportResponseImplCopyWith<$Res>
    implements $UploadSipReportResponseCopyWith<$Res> {
  factory _$$UploadSipReportResponseImplCopyWith(
    _$UploadSipReportResponseImpl value,
    $Res Function(_$UploadSipReportResponseImpl) then,
  ) = __$$UploadSipReportResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, bool? success});
}

/// @nodoc
class __$$UploadSipReportResponseImplCopyWithImpl<$Res>
    extends
        _$UploadSipReportResponseCopyWithImpl<
          $Res,
          _$UploadSipReportResponseImpl
        >
    implements _$$UploadSipReportResponseImplCopyWith<$Res> {
  __$$UploadSipReportResponseImplCopyWithImpl(
    _$UploadSipReportResponseImpl _value,
    $Res Function(_$UploadSipReportResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UploadSipReportResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = freezed, Object? success = freezed}) {
    return _then(
      _$UploadSipReportResponseImpl(
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        success: freezed == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadSipReportResponseImpl implements _UploadSipReportResponse {
  const _$UploadSipReportResponseImpl({this.message, this.success});

  factory _$UploadSipReportResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadSipReportResponseImplFromJson(json);

  @override
  final String? message;
  @override
  final bool? success;

  @override
  String toString() {
    return 'UploadSipReportResponse(message: $message, success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadSipReportResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, success);

  /// Create a copy of UploadSipReportResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadSipReportResponseImplCopyWith<_$UploadSipReportResponseImpl>
  get copyWith =>
      __$$UploadSipReportResponseImplCopyWithImpl<
        _$UploadSipReportResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadSipReportResponseImplToJson(this);
  }
}

abstract class _UploadSipReportResponse implements UploadSipReportResponse {
  const factory _UploadSipReportResponse({
    final String? message,
    final bool? success,
  }) = _$UploadSipReportResponseImpl;

  factory _UploadSipReportResponse.fromJson(Map<String, dynamic> json) =
      _$UploadSipReportResponseImpl.fromJson;

  @override
  String? get message;
  @override
  bool? get success;

  /// Create a copy of UploadSipReportResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadSipReportResponseImplCopyWith<_$UploadSipReportResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
