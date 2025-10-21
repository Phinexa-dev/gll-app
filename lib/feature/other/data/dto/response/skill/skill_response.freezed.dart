// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'skill_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SkillResponse _$SkillResponseFromJson(Map<String, dynamic> json) {
  return _SkillResponse.fromJson(json);
}

/// @nodoc
mixin _$SkillResponse {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "skill")
  String get skill => throw _privateConstructorUsedError;
  @JsonKey(name: "uid")
  int get uid => throw _privateConstructorUsedError;

  /// Serializes this SkillResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SkillResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SkillResponseCopyWith<SkillResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkillResponseCopyWith<$Res> {
  factory $SkillResponseCopyWith(
    SkillResponse value,
    $Res Function(SkillResponse) then,
  ) = _$SkillResponseCopyWithImpl<$Res, SkillResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "id") int id,
    @JsonKey(name: "skill") String skill,
    @JsonKey(name: "uid") int uid,
  });
}

/// @nodoc
class _$SkillResponseCopyWithImpl<$Res, $Val extends SkillResponse>
    implements $SkillResponseCopyWith<$Res> {
  _$SkillResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SkillResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? skill = null, Object? uid = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            skill: null == skill
                ? _value.skill
                : skill // ignore: cast_nullable_to_non_nullable
                      as String,
            uid: null == uid
                ? _value.uid
                : uid // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SkillResponseImplCopyWith<$Res>
    implements $SkillResponseCopyWith<$Res> {
  factory _$$SkillResponseImplCopyWith(
    _$SkillResponseImpl value,
    $Res Function(_$SkillResponseImpl) then,
  ) = __$$SkillResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "id") int id,
    @JsonKey(name: "skill") String skill,
    @JsonKey(name: "uid") int uid,
  });
}

/// @nodoc
class __$$SkillResponseImplCopyWithImpl<$Res>
    extends _$SkillResponseCopyWithImpl<$Res, _$SkillResponseImpl>
    implements _$$SkillResponseImplCopyWith<$Res> {
  __$$SkillResponseImplCopyWithImpl(
    _$SkillResponseImpl _value,
    $Res Function(_$SkillResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SkillResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? skill = null, Object? uid = null}) {
    return _then(
      _$SkillResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        skill: null == skill
            ? _value.skill
            : skill // ignore: cast_nullable_to_non_nullable
                  as String,
        uid: null == uid
            ? _value.uid
            : uid // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SkillResponseImpl implements _SkillResponse {
  const _$SkillResponseImpl({
    @JsonKey(name: "id") required this.id,
    @JsonKey(name: "skill") required this.skill,
    @JsonKey(name: "uid") required this.uid,
  });

  factory _$SkillResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SkillResponseImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "skill")
  final String skill;
  @override
  @JsonKey(name: "uid")
  final int uid;

  @override
  String toString() {
    return 'SkillResponse(id: $id, skill: $skill, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkillResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.skill, skill) || other.skill == skill) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, skill, uid);

  /// Create a copy of SkillResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SkillResponseImplCopyWith<_$SkillResponseImpl> get copyWith =>
      __$$SkillResponseImplCopyWithImpl<_$SkillResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SkillResponseImplToJson(this);
  }
}

abstract class _SkillResponse implements SkillResponse {
  const factory _SkillResponse({
    @JsonKey(name: "id") required final int id,
    @JsonKey(name: "skill") required final String skill,
    @JsonKey(name: "uid") required final int uid,
  }) = _$SkillResponseImpl;

  factory _SkillResponse.fromJson(Map<String, dynamic> json) =
      _$SkillResponseImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "skill")
  String get skill;
  @override
  @JsonKey(name: "uid")
  int get uid;

  /// Create a copy of SkillResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SkillResponseImplCopyWith<_$SkillResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
