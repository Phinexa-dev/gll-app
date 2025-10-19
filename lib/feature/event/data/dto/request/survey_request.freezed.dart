// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'survey_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PreSurveyRequest _$PreSurveyRequestFromJson(Map<String, dynamic> json) {
  return _PreSurveyRequest.fromJson(json);
}

/// @nodoc
mixin _$PreSurveyRequest {
  @JsonKey(name: "survey")
  Map<String, dynamic> get survey => throw _privateConstructorUsedError;

  /// Serializes this PreSurveyRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PreSurveyRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PreSurveyRequestCopyWith<PreSurveyRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreSurveyRequestCopyWith<$Res> {
  factory $PreSurveyRequestCopyWith(
    PreSurveyRequest value,
    $Res Function(PreSurveyRequest) then,
  ) = _$PreSurveyRequestCopyWithImpl<$Res, PreSurveyRequest>;
  @useResult
  $Res call({@JsonKey(name: "survey") Map<String, dynamic> survey});
}

/// @nodoc
class _$PreSurveyRequestCopyWithImpl<$Res, $Val extends PreSurveyRequest>
    implements $PreSurveyRequestCopyWith<$Res> {
  _$PreSurveyRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PreSurveyRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? survey = null}) {
    return _then(
      _value.copyWith(
            survey: null == survey
                ? _value.survey
                : survey // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PreSurveyRequestImplCopyWith<$Res>
    implements $PreSurveyRequestCopyWith<$Res> {
  factory _$$PreSurveyRequestImplCopyWith(
    _$PreSurveyRequestImpl value,
    $Res Function(_$PreSurveyRequestImpl) then,
  ) = __$$PreSurveyRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "survey") Map<String, dynamic> survey});
}

/// @nodoc
class __$$PreSurveyRequestImplCopyWithImpl<$Res>
    extends _$PreSurveyRequestCopyWithImpl<$Res, _$PreSurveyRequestImpl>
    implements _$$PreSurveyRequestImplCopyWith<$Res> {
  __$$PreSurveyRequestImplCopyWithImpl(
    _$PreSurveyRequestImpl _value,
    $Res Function(_$PreSurveyRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PreSurveyRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? survey = null}) {
    return _then(
      _$PreSurveyRequestImpl(
        survey: null == survey
            ? _value._survey
            : survey // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PreSurveyRequestImpl implements _PreSurveyRequest {
  const _$PreSurveyRequestImpl({
    @JsonKey(name: "survey") required final Map<String, dynamic> survey,
  }) : _survey = survey;

  factory _$PreSurveyRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreSurveyRequestImplFromJson(json);

  final Map<String, dynamic> _survey;
  @override
  @JsonKey(name: "survey")
  Map<String, dynamic> get survey {
    if (_survey is EqualUnmodifiableMapView) return _survey;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_survey);
  }

  @override
  String toString() {
    return 'PreSurveyRequest(survey: $survey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreSurveyRequestImpl &&
            const DeepCollectionEquality().equals(other._survey, _survey));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_survey));

  /// Create a copy of PreSurveyRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PreSurveyRequestImplCopyWith<_$PreSurveyRequestImpl> get copyWith =>
      __$$PreSurveyRequestImplCopyWithImpl<_$PreSurveyRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PreSurveyRequestImplToJson(this);
  }
}

abstract class _PreSurveyRequest implements PreSurveyRequest {
  const factory _PreSurveyRequest({
    @JsonKey(name: "survey") required final Map<String, dynamic> survey,
  }) = _$PreSurveyRequestImpl;

  factory _PreSurveyRequest.fromJson(Map<String, dynamic> json) =
      _$PreSurveyRequestImpl.fromJson;

  @override
  @JsonKey(name: "survey")
  Map<String, dynamic> get survey;

  /// Create a copy of PreSurveyRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PreSurveyRequestImplCopyWith<_$PreSurveyRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PostSurveyRequest _$PostSurveyRequestFromJson(Map<String, dynamic> json) {
  return _PostSurveyRequest.fromJson(json);
}

/// @nodoc
mixin _$PostSurveyRequest {
  @JsonKey(name: "post_survey")
  Map<String, dynamic> get postSurvey => throw _privateConstructorUsedError;

  /// Serializes this PostSurveyRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostSurveyRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostSurveyRequestCopyWith<PostSurveyRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostSurveyRequestCopyWith<$Res> {
  factory $PostSurveyRequestCopyWith(
    PostSurveyRequest value,
    $Res Function(PostSurveyRequest) then,
  ) = _$PostSurveyRequestCopyWithImpl<$Res, PostSurveyRequest>;
  @useResult
  $Res call({@JsonKey(name: "post_survey") Map<String, dynamic> postSurvey});
}

/// @nodoc
class _$PostSurveyRequestCopyWithImpl<$Res, $Val extends PostSurveyRequest>
    implements $PostSurveyRequestCopyWith<$Res> {
  _$PostSurveyRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostSurveyRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? postSurvey = null}) {
    return _then(
      _value.copyWith(
            postSurvey: null == postSurvey
                ? _value.postSurvey
                : postSurvey // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PostSurveyRequestImplCopyWith<$Res>
    implements $PostSurveyRequestCopyWith<$Res> {
  factory _$$PostSurveyRequestImplCopyWith(
    _$PostSurveyRequestImpl value,
    $Res Function(_$PostSurveyRequestImpl) then,
  ) = __$$PostSurveyRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "post_survey") Map<String, dynamic> postSurvey});
}

/// @nodoc
class __$$PostSurveyRequestImplCopyWithImpl<$Res>
    extends _$PostSurveyRequestCopyWithImpl<$Res, _$PostSurveyRequestImpl>
    implements _$$PostSurveyRequestImplCopyWith<$Res> {
  __$$PostSurveyRequestImplCopyWithImpl(
    _$PostSurveyRequestImpl _value,
    $Res Function(_$PostSurveyRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostSurveyRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? postSurvey = null}) {
    return _then(
      _$PostSurveyRequestImpl(
        postSurvey: null == postSurvey
            ? _value._postSurvey
            : postSurvey // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PostSurveyRequestImpl implements _PostSurveyRequest {
  const _$PostSurveyRequestImpl({
    @JsonKey(name: "post_survey")
    required final Map<String, dynamic> postSurvey,
  }) : _postSurvey = postSurvey;

  factory _$PostSurveyRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostSurveyRequestImplFromJson(json);

  final Map<String, dynamic> _postSurvey;
  @override
  @JsonKey(name: "post_survey")
  Map<String, dynamic> get postSurvey {
    if (_postSurvey is EqualUnmodifiableMapView) return _postSurvey;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_postSurvey);
  }

  @override
  String toString() {
    return 'PostSurveyRequest(postSurvey: $postSurvey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostSurveyRequestImpl &&
            const DeepCollectionEquality().equals(
              other._postSurvey,
              _postSurvey,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_postSurvey),
  );

  /// Create a copy of PostSurveyRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostSurveyRequestImplCopyWith<_$PostSurveyRequestImpl> get copyWith =>
      __$$PostSurveyRequestImplCopyWithImpl<_$PostSurveyRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PostSurveyRequestImplToJson(this);
  }
}

abstract class _PostSurveyRequest implements PostSurveyRequest {
  const factory _PostSurveyRequest({
    @JsonKey(name: "post_survey")
    required final Map<String, dynamic> postSurvey,
  }) = _$PostSurveyRequestImpl;

  factory _PostSurveyRequest.fromJson(Map<String, dynamic> json) =
      _$PostSurveyRequestImpl.fromJson;

  @override
  @JsonKey(name: "post_survey")
  Map<String, dynamic> get postSurvey;

  /// Create a copy of PostSurveyRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostSurveyRequestImplCopyWith<_$PostSurveyRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
