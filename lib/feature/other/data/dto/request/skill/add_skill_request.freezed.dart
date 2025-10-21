// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_skill_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AddSkillRequest _$AddSkillRequestFromJson(Map<String, dynamic> json) {
  return _AddSkillRequest.fromJson(json);
}

/// @nodoc
mixin _$AddSkillRequest {
  @JsonKey(name: "skill")
  String get skill => throw _privateConstructorUsedError;

  /// Serializes this AddSkillRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddSkillRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddSkillRequestCopyWith<AddSkillRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddSkillRequestCopyWith<$Res> {
  factory $AddSkillRequestCopyWith(
    AddSkillRequest value,
    $Res Function(AddSkillRequest) then,
  ) = _$AddSkillRequestCopyWithImpl<$Res, AddSkillRequest>;
  @useResult
  $Res call({@JsonKey(name: "skill") String skill});
}

/// @nodoc
class _$AddSkillRequestCopyWithImpl<$Res, $Val extends AddSkillRequest>
    implements $AddSkillRequestCopyWith<$Res> {
  _$AddSkillRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddSkillRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? skill = null}) {
    return _then(
      _value.copyWith(
            skill: null == skill
                ? _value.skill
                : skill // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AddSkillRequestImplCopyWith<$Res>
    implements $AddSkillRequestCopyWith<$Res> {
  factory _$$AddSkillRequestImplCopyWith(
    _$AddSkillRequestImpl value,
    $Res Function(_$AddSkillRequestImpl) then,
  ) = __$$AddSkillRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "skill") String skill});
}

/// @nodoc
class __$$AddSkillRequestImplCopyWithImpl<$Res>
    extends _$AddSkillRequestCopyWithImpl<$Res, _$AddSkillRequestImpl>
    implements _$$AddSkillRequestImplCopyWith<$Res> {
  __$$AddSkillRequestImplCopyWithImpl(
    _$AddSkillRequestImpl _value,
    $Res Function(_$AddSkillRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddSkillRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? skill = null}) {
    return _then(
      _$AddSkillRequestImpl(
        skill: null == skill
            ? _value.skill
            : skill // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AddSkillRequestImpl implements _AddSkillRequest {
  const _$AddSkillRequestImpl({@JsonKey(name: "skill") required this.skill});

  factory _$AddSkillRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddSkillRequestImplFromJson(json);

  @override
  @JsonKey(name: "skill")
  final String skill;

  @override
  String toString() {
    return 'AddSkillRequest(skill: $skill)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddSkillRequestImpl &&
            (identical(other.skill, skill) || other.skill == skill));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, skill);

  /// Create a copy of AddSkillRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddSkillRequestImplCopyWith<_$AddSkillRequestImpl> get copyWith =>
      __$$AddSkillRequestImplCopyWithImpl<_$AddSkillRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AddSkillRequestImplToJson(this);
  }
}

abstract class _AddSkillRequest implements AddSkillRequest {
  const factory _AddSkillRequest({
    @JsonKey(name: "skill") required final String skill,
  }) = _$AddSkillRequestImpl;

  factory _AddSkillRequest.fromJson(Map<String, dynamic> json) =
      _$AddSkillRequestImpl.fromJson;

  @override
  @JsonKey(name: "skill")
  String get skill;

  /// Create a copy of AddSkillRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddSkillRequestImplCopyWith<_$AddSkillRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
