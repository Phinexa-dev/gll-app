// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'survey_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SurveyResponse _$SurveyResponseFromJson(Map<String, dynamic> json) {
  return _SurveyResponse.fromJson(json);
}

/// @nodoc
mixin _$SurveyResponse {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "uid")
  int get uid => throw _privateConstructorUsedError;
  @JsonKey(name: "event_id")
  int get eventId => throw _privateConstructorUsedError;
  @JsonKey(name: "time")
  DateTime get time => throw _privateConstructorUsedError;
  @JsonKey(name: "pre_survey")
  dynamic get preSurvey => throw _privateConstructorUsedError;
  @JsonKey(name: "survey")
  dynamic get survey => throw _privateConstructorUsedError;
  @JsonKey(name: "post_survey")
  dynamic get postSurvey => throw _privateConstructorUsedError;
  @JsonKey(name: "pre_survey_submitted")
  bool get preSurveySubmitted => throw _privateConstructorUsedError;
  @JsonKey(name: "survey_submitted")
  bool get surveySubmitted => throw _privateConstructorUsedError;
  @JsonKey(name: "post_survey_submitted")
  bool get postSurveySubmitted => throw _privateConstructorUsedError;

  /// Serializes this SurveyResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SurveyResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SurveyResponseCopyWith<SurveyResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyResponseCopyWith<$Res> {
  factory $SurveyResponseCopyWith(
    SurveyResponse value,
    $Res Function(SurveyResponse) then,
  ) = _$SurveyResponseCopyWithImpl<$Res, SurveyResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "id") int id,
    @JsonKey(name: "uid") int uid,
    @JsonKey(name: "event_id") int eventId,
    @JsonKey(name: "time") DateTime time,
    @JsonKey(name: "pre_survey") dynamic preSurvey,
    @JsonKey(name: "survey") dynamic survey,
    @JsonKey(name: "post_survey") dynamic postSurvey,
    @JsonKey(name: "pre_survey_submitted") bool preSurveySubmitted,
    @JsonKey(name: "survey_submitted") bool surveySubmitted,
    @JsonKey(name: "post_survey_submitted") bool postSurveySubmitted,
  });
}

/// @nodoc
class _$SurveyResponseCopyWithImpl<$Res, $Val extends SurveyResponse>
    implements $SurveyResponseCopyWith<$Res> {
  _$SurveyResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SurveyResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uid = null,
    Object? eventId = null,
    Object? time = null,
    Object? preSurvey = freezed,
    Object? survey = freezed,
    Object? postSurvey = freezed,
    Object? preSurveySubmitted = null,
    Object? surveySubmitted = null,
    Object? postSurveySubmitted = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            uid: null == uid
                ? _value.uid
                : uid // ignore: cast_nullable_to_non_nullable
                      as int,
            eventId: null == eventId
                ? _value.eventId
                : eventId // ignore: cast_nullable_to_non_nullable
                      as int,
            time: null == time
                ? _value.time
                : time // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            preSurvey: freezed == preSurvey
                ? _value.preSurvey
                : preSurvey // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            survey: freezed == survey
                ? _value.survey
                : survey // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            postSurvey: freezed == postSurvey
                ? _value.postSurvey
                : postSurvey // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            preSurveySubmitted: null == preSurveySubmitted
                ? _value.preSurveySubmitted
                : preSurveySubmitted // ignore: cast_nullable_to_non_nullable
                      as bool,
            surveySubmitted: null == surveySubmitted
                ? _value.surveySubmitted
                : surveySubmitted // ignore: cast_nullable_to_non_nullable
                      as bool,
            postSurveySubmitted: null == postSurveySubmitted
                ? _value.postSurveySubmitted
                : postSurveySubmitted // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SurveyResponseImplCopyWith<$Res>
    implements $SurveyResponseCopyWith<$Res> {
  factory _$$SurveyResponseImplCopyWith(
    _$SurveyResponseImpl value,
    $Res Function(_$SurveyResponseImpl) then,
  ) = __$$SurveyResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "id") int id,
    @JsonKey(name: "uid") int uid,
    @JsonKey(name: "event_id") int eventId,
    @JsonKey(name: "time") DateTime time,
    @JsonKey(name: "pre_survey") dynamic preSurvey,
    @JsonKey(name: "survey") dynamic survey,
    @JsonKey(name: "post_survey") dynamic postSurvey,
    @JsonKey(name: "pre_survey_submitted") bool preSurveySubmitted,
    @JsonKey(name: "survey_submitted") bool surveySubmitted,
    @JsonKey(name: "post_survey_submitted") bool postSurveySubmitted,
  });
}

/// @nodoc
class __$$SurveyResponseImplCopyWithImpl<$Res>
    extends _$SurveyResponseCopyWithImpl<$Res, _$SurveyResponseImpl>
    implements _$$SurveyResponseImplCopyWith<$Res> {
  __$$SurveyResponseImplCopyWithImpl(
    _$SurveyResponseImpl _value,
    $Res Function(_$SurveyResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SurveyResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uid = null,
    Object? eventId = null,
    Object? time = null,
    Object? preSurvey = freezed,
    Object? survey = freezed,
    Object? postSurvey = freezed,
    Object? preSurveySubmitted = null,
    Object? surveySubmitted = null,
    Object? postSurveySubmitted = null,
  }) {
    return _then(
      _$SurveyResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        uid: null == uid
            ? _value.uid
            : uid // ignore: cast_nullable_to_non_nullable
                  as int,
        eventId: null == eventId
            ? _value.eventId
            : eventId // ignore: cast_nullable_to_non_nullable
                  as int,
        time: null == time
            ? _value.time
            : time // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        preSurvey: freezed == preSurvey
            ? _value.preSurvey
            : preSurvey // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        survey: freezed == survey
            ? _value.survey
            : survey // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        postSurvey: freezed == postSurvey
            ? _value.postSurvey
            : postSurvey // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        preSurveySubmitted: null == preSurveySubmitted
            ? _value.preSurveySubmitted
            : preSurveySubmitted // ignore: cast_nullable_to_non_nullable
                  as bool,
        surveySubmitted: null == surveySubmitted
            ? _value.surveySubmitted
            : surveySubmitted // ignore: cast_nullable_to_non_nullable
                  as bool,
        postSurveySubmitted: null == postSurveySubmitted
            ? _value.postSurveySubmitted
            : postSurveySubmitted // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SurveyResponseImpl implements _SurveyResponse {
  const _$SurveyResponseImpl({
    @JsonKey(name: "id") required this.id,
    @JsonKey(name: "uid") required this.uid,
    @JsonKey(name: "event_id") required this.eventId,
    @JsonKey(name: "time") required this.time,
    @JsonKey(name: "pre_survey") this.preSurvey,
    @JsonKey(name: "survey") this.survey,
    @JsonKey(name: "post_survey") this.postSurvey,
    @JsonKey(name: "pre_survey_submitted") required this.preSurveySubmitted,
    @JsonKey(name: "survey_submitted") required this.surveySubmitted,
    @JsonKey(name: "post_survey_submitted") required this.postSurveySubmitted,
  });

  factory _$SurveyResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SurveyResponseImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "uid")
  final int uid;
  @override
  @JsonKey(name: "event_id")
  final int eventId;
  @override
  @JsonKey(name: "time")
  final DateTime time;
  @override
  @JsonKey(name: "pre_survey")
  final dynamic preSurvey;
  @override
  @JsonKey(name: "survey")
  final dynamic survey;
  @override
  @JsonKey(name: "post_survey")
  final dynamic postSurvey;
  @override
  @JsonKey(name: "pre_survey_submitted")
  final bool preSurveySubmitted;
  @override
  @JsonKey(name: "survey_submitted")
  final bool surveySubmitted;
  @override
  @JsonKey(name: "post_survey_submitted")
  final bool postSurveySubmitted;

  @override
  String toString() {
    return 'SurveyResponse(id: $id, uid: $uid, eventId: $eventId, time: $time, preSurvey: $preSurvey, survey: $survey, postSurvey: $postSurvey, preSurveySubmitted: $preSurveySubmitted, surveySubmitted: $surveySubmitted, postSurveySubmitted: $postSurveySubmitted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SurveyResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.time, time) || other.time == time) &&
            const DeepCollectionEquality().equals(other.preSurvey, preSurvey) &&
            const DeepCollectionEquality().equals(other.survey, survey) &&
            const DeepCollectionEquality().equals(
              other.postSurvey,
              postSurvey,
            ) &&
            (identical(other.preSurveySubmitted, preSurveySubmitted) ||
                other.preSurveySubmitted == preSurveySubmitted) &&
            (identical(other.surveySubmitted, surveySubmitted) ||
                other.surveySubmitted == surveySubmitted) &&
            (identical(other.postSurveySubmitted, postSurveySubmitted) ||
                other.postSurveySubmitted == postSurveySubmitted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    uid,
    eventId,
    time,
    const DeepCollectionEquality().hash(preSurvey),
    const DeepCollectionEquality().hash(survey),
    const DeepCollectionEquality().hash(postSurvey),
    preSurveySubmitted,
    surveySubmitted,
    postSurveySubmitted,
  );

  /// Create a copy of SurveyResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SurveyResponseImplCopyWith<_$SurveyResponseImpl> get copyWith =>
      __$$SurveyResponseImplCopyWithImpl<_$SurveyResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SurveyResponseImplToJson(this);
  }
}

abstract class _SurveyResponse implements SurveyResponse {
  const factory _SurveyResponse({
    @JsonKey(name: "id") required final int id,
    @JsonKey(name: "uid") required final int uid,
    @JsonKey(name: "event_id") required final int eventId,
    @JsonKey(name: "time") required final DateTime time,
    @JsonKey(name: "pre_survey") final dynamic preSurvey,
    @JsonKey(name: "survey") final dynamic survey,
    @JsonKey(name: "post_survey") final dynamic postSurvey,
    @JsonKey(name: "pre_survey_submitted")
    required final bool preSurveySubmitted,
    @JsonKey(name: "survey_submitted") required final bool surveySubmitted,
    @JsonKey(name: "post_survey_submitted")
    required final bool postSurveySubmitted,
  }) = _$SurveyResponseImpl;

  factory _SurveyResponse.fromJson(Map<String, dynamic> json) =
      _$SurveyResponseImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "uid")
  int get uid;
  @override
  @JsonKey(name: "event_id")
  int get eventId;
  @override
  @JsonKey(name: "time")
  DateTime get time;
  @override
  @JsonKey(name: "pre_survey")
  dynamic get preSurvey;
  @override
  @JsonKey(name: "survey")
  dynamic get survey;
  @override
  @JsonKey(name: "post_survey")
  dynamic get postSurvey;
  @override
  @JsonKey(name: "pre_survey_submitted")
  bool get preSurveySubmitted;
  @override
  @JsonKey(name: "survey_submitted")
  bool get surveySubmitted;
  @override
  @JsonKey(name: "post_survey_submitted")
  bool get postSurveySubmitted;

  /// Create a copy of SurveyResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SurveyResponseImplCopyWith<_$SurveyResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
