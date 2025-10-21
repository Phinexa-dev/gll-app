// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_education_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AddEducationRequest _$AddEducationRequestFromJson(Map<String, dynamic> json) {
  return _AddEducationRequest.fromJson(json);
}

/// @nodoc
mixin _$AddEducationRequest {
  @JsonKey(name: "school")
  String get school => throw _privateConstructorUsedError;
  @JsonKey(name: "degree")
  String get degree => throw _privateConstructorUsedError;
  @JsonKey(name: "startdate")
  DateTime get startdate => throw _privateConstructorUsedError;
  @JsonKey(name: "enddate")
  DateTime get enddate => throw _privateConstructorUsedError;

  /// Serializes this AddEducationRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddEducationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddEducationRequestCopyWith<AddEducationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddEducationRequestCopyWith<$Res> {
  factory $AddEducationRequestCopyWith(
    AddEducationRequest value,
    $Res Function(AddEducationRequest) then,
  ) = _$AddEducationRequestCopyWithImpl<$Res, AddEducationRequest>;
  @useResult
  $Res call({
    @JsonKey(name: "school") String school,
    @JsonKey(name: "degree") String degree,
    @JsonKey(name: "startdate") DateTime startdate,
    @JsonKey(name: "enddate") DateTime enddate,
  });
}

/// @nodoc
class _$AddEducationRequestCopyWithImpl<$Res, $Val extends AddEducationRequest>
    implements $AddEducationRequestCopyWith<$Res> {
  _$AddEducationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddEducationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? school = null,
    Object? degree = null,
    Object? startdate = null,
    Object? enddate = null,
  }) {
    return _then(
      _value.copyWith(
            school: null == school
                ? _value.school
                : school // ignore: cast_nullable_to_non_nullable
                      as String,
            degree: null == degree
                ? _value.degree
                : degree // ignore: cast_nullable_to_non_nullable
                      as String,
            startdate: null == startdate
                ? _value.startdate
                : startdate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            enddate: null == enddate
                ? _value.enddate
                : enddate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AddEducationRequestImplCopyWith<$Res>
    implements $AddEducationRequestCopyWith<$Res> {
  factory _$$AddEducationRequestImplCopyWith(
    _$AddEducationRequestImpl value,
    $Res Function(_$AddEducationRequestImpl) then,
  ) = __$$AddEducationRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "school") String school,
    @JsonKey(name: "degree") String degree,
    @JsonKey(name: "startdate") DateTime startdate,
    @JsonKey(name: "enddate") DateTime enddate,
  });
}

/// @nodoc
class __$$AddEducationRequestImplCopyWithImpl<$Res>
    extends _$AddEducationRequestCopyWithImpl<$Res, _$AddEducationRequestImpl>
    implements _$$AddEducationRequestImplCopyWith<$Res> {
  __$$AddEducationRequestImplCopyWithImpl(
    _$AddEducationRequestImpl _value,
    $Res Function(_$AddEducationRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddEducationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? school = null,
    Object? degree = null,
    Object? startdate = null,
    Object? enddate = null,
  }) {
    return _then(
      _$AddEducationRequestImpl(
        school: null == school
            ? _value.school
            : school // ignore: cast_nullable_to_non_nullable
                  as String,
        degree: null == degree
            ? _value.degree
            : degree // ignore: cast_nullable_to_non_nullable
                  as String,
        startdate: null == startdate
            ? _value.startdate
            : startdate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        enddate: null == enddate
            ? _value.enddate
            : enddate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AddEducationRequestImpl implements _AddEducationRequest {
  const _$AddEducationRequestImpl({
    @JsonKey(name: "school") required this.school,
    @JsonKey(name: "degree") required this.degree,
    @JsonKey(name: "startdate") required this.startdate,
    @JsonKey(name: "enddate") required this.enddate,
  });

  factory _$AddEducationRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddEducationRequestImplFromJson(json);

  @override
  @JsonKey(name: "school")
  final String school;
  @override
  @JsonKey(name: "degree")
  final String degree;
  @override
  @JsonKey(name: "startdate")
  final DateTime startdate;
  @override
  @JsonKey(name: "enddate")
  final DateTime enddate;

  @override
  String toString() {
    return 'AddEducationRequest(school: $school, degree: $degree, startdate: $startdate, enddate: $enddate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddEducationRequestImpl &&
            (identical(other.school, school) || other.school == school) &&
            (identical(other.degree, degree) || other.degree == degree) &&
            (identical(other.startdate, startdate) ||
                other.startdate == startdate) &&
            (identical(other.enddate, enddate) || other.enddate == enddate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, school, degree, startdate, enddate);

  /// Create a copy of AddEducationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddEducationRequestImplCopyWith<_$AddEducationRequestImpl> get copyWith =>
      __$$AddEducationRequestImplCopyWithImpl<_$AddEducationRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AddEducationRequestImplToJson(this);
  }
}

abstract class _AddEducationRequest implements AddEducationRequest {
  const factory _AddEducationRequest({
    @JsonKey(name: "school") required final String school,
    @JsonKey(name: "degree") required final String degree,
    @JsonKey(name: "startdate") required final DateTime startdate,
    @JsonKey(name: "enddate") required final DateTime enddate,
  }) = _$AddEducationRequestImpl;

  factory _AddEducationRequest.fromJson(Map<String, dynamic> json) =
      _$AddEducationRequestImpl.fromJson;

  @override
  @JsonKey(name: "school")
  String get school;
  @override
  @JsonKey(name: "degree")
  String get degree;
  @override
  @JsonKey(name: "startdate")
  DateTime get startdate;
  @override
  @JsonKey(name: "enddate")
  DateTime get enddate;

  /// Create a copy of AddEducationRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddEducationRequestImplCopyWith<_$AddEducationRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
