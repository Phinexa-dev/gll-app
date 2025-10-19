// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EventResponse _$EventResponseFromJson(Map<String, dynamic> json) {
  return _EventResponse.fromJson(json);
}

/// @nodoc
mixin _$EventResponse {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "start_date")
  String get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: "end_date")
  String get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: "location")
  String get location => throw _privateConstructorUsedError;
  @JsonKey(name: "latitude")
  String get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: "longitude")
  String get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "subtitle")
  String get subtitle => throw _privateConstructorUsedError;
  @JsonKey(name: "event_type")
  String get eventType => throw _privateConstructorUsedError;
  @JsonKey(name: "userevent")
  List<UserEventResponse> get userEvents => throw _privateConstructorUsedError;
  @JsonKey(name: "eventguest")
  List<EventGuestResponse> get eventGuests =>
      throw _privateConstructorUsedError;

  /// Serializes this EventResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventResponseCopyWith<EventResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventResponseCopyWith<$Res> {
  factory $EventResponseCopyWith(
    EventResponse value,
    $Res Function(EventResponse) then,
  ) = _$EventResponseCopyWithImpl<$Res, EventResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "id") int id,
    @JsonKey(name: "name") String name,
    @JsonKey(name: "start_date") String startDate,
    @JsonKey(name: "end_date") String endDate,
    @JsonKey(name: "location") String location,
    @JsonKey(name: "latitude") String latitude,
    @JsonKey(name: "longitude") String longitude,
    @JsonKey(name: "description") String description,
    @JsonKey(name: "subtitle") String subtitle,
    @JsonKey(name: "event_type") String eventType,
    @JsonKey(name: "userevent") List<UserEventResponse> userEvents,
    @JsonKey(name: "eventguest") List<EventGuestResponse> eventGuests,
  });
}

/// @nodoc
class _$EventResponseCopyWithImpl<$Res, $Val extends EventResponse>
    implements $EventResponseCopyWith<$Res> {
  _$EventResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? location = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? description = null,
    Object? subtitle = null,
    Object? eventType = null,
    Object? userEvents = null,
    Object? eventGuests = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as String,
            endDate: null == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as String,
            location: null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String,
            latitude: null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as String,
            longitude: null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            subtitle: null == subtitle
                ? _value.subtitle
                : subtitle // ignore: cast_nullable_to_non_nullable
                      as String,
            eventType: null == eventType
                ? _value.eventType
                : eventType // ignore: cast_nullable_to_non_nullable
                      as String,
            userEvents: null == userEvents
                ? _value.userEvents
                : userEvents // ignore: cast_nullable_to_non_nullable
                      as List<UserEventResponse>,
            eventGuests: null == eventGuests
                ? _value.eventGuests
                : eventGuests // ignore: cast_nullable_to_non_nullable
                      as List<EventGuestResponse>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EventResponseImplCopyWith<$Res>
    implements $EventResponseCopyWith<$Res> {
  factory _$$EventResponseImplCopyWith(
    _$EventResponseImpl value,
    $Res Function(_$EventResponseImpl) then,
  ) = __$$EventResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "id") int id,
    @JsonKey(name: "name") String name,
    @JsonKey(name: "start_date") String startDate,
    @JsonKey(name: "end_date") String endDate,
    @JsonKey(name: "location") String location,
    @JsonKey(name: "latitude") String latitude,
    @JsonKey(name: "longitude") String longitude,
    @JsonKey(name: "description") String description,
    @JsonKey(name: "subtitle") String subtitle,
    @JsonKey(name: "event_type") String eventType,
    @JsonKey(name: "userevent") List<UserEventResponse> userEvents,
    @JsonKey(name: "eventguest") List<EventGuestResponse> eventGuests,
  });
}

/// @nodoc
class __$$EventResponseImplCopyWithImpl<$Res>
    extends _$EventResponseCopyWithImpl<$Res, _$EventResponseImpl>
    implements _$$EventResponseImplCopyWith<$Res> {
  __$$EventResponseImplCopyWithImpl(
    _$EventResponseImpl _value,
    $Res Function(_$EventResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EventResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? location = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? description = null,
    Object? subtitle = null,
    Object? eventType = null,
    Object? userEvents = null,
    Object? eventGuests = null,
  }) {
    return _then(
      _$EventResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as String,
        endDate: null == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as String,
        location: null == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String,
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as String,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        subtitle: null == subtitle
            ? _value.subtitle
            : subtitle // ignore: cast_nullable_to_non_nullable
                  as String,
        eventType: null == eventType
            ? _value.eventType
            : eventType // ignore: cast_nullable_to_non_nullable
                  as String,
        userEvents: null == userEvents
            ? _value._userEvents
            : userEvents // ignore: cast_nullable_to_non_nullable
                  as List<UserEventResponse>,
        eventGuests: null == eventGuests
            ? _value._eventGuests
            : eventGuests // ignore: cast_nullable_to_non_nullable
                  as List<EventGuestResponse>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EventResponseImpl implements _EventResponse {
  const _$EventResponseImpl({
    @JsonKey(name: "id") required this.id,
    @JsonKey(name: "name") required this.name,
    @JsonKey(name: "start_date") required this.startDate,
    @JsonKey(name: "end_date") required this.endDate,
    @JsonKey(name: "location") required this.location,
    @JsonKey(name: "latitude") required this.latitude,
    @JsonKey(name: "longitude") required this.longitude,
    @JsonKey(name: "description") required this.description,
    @JsonKey(name: "subtitle") required this.subtitle,
    @JsonKey(name: "event_type") required this.eventType,
    @JsonKey(name: "userevent")
    required final List<UserEventResponse> userEvents,
    @JsonKey(name: "eventguest")
    required final List<EventGuestResponse> eventGuests,
  }) : _userEvents = userEvents,
       _eventGuests = eventGuests;

  factory _$EventResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventResponseImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "start_date")
  final String startDate;
  @override
  @JsonKey(name: "end_date")
  final String endDate;
  @override
  @JsonKey(name: "location")
  final String location;
  @override
  @JsonKey(name: "latitude")
  final String latitude;
  @override
  @JsonKey(name: "longitude")
  final String longitude;
  @override
  @JsonKey(name: "description")
  final String description;
  @override
  @JsonKey(name: "subtitle")
  final String subtitle;
  @override
  @JsonKey(name: "event_type")
  final String eventType;
  final List<UserEventResponse> _userEvents;
  @override
  @JsonKey(name: "userevent")
  List<UserEventResponse> get userEvents {
    if (_userEvents is EqualUnmodifiableListView) return _userEvents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userEvents);
  }

  final List<EventGuestResponse> _eventGuests;
  @override
  @JsonKey(name: "eventguest")
  List<EventGuestResponse> get eventGuests {
    if (_eventGuests is EqualUnmodifiableListView) return _eventGuests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_eventGuests);
  }

  @override
  String toString() {
    return 'EventResponse(id: $id, name: $name, startDate: $startDate, endDate: $endDate, location: $location, latitude: $latitude, longitude: $longitude, description: $description, subtitle: $subtitle, eventType: $eventType, userEvents: $userEvents, eventGuests: $eventGuests)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            const DeepCollectionEquality().equals(
              other._userEvents,
              _userEvents,
            ) &&
            const DeepCollectionEquality().equals(
              other._eventGuests,
              _eventGuests,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    startDate,
    endDate,
    location,
    latitude,
    longitude,
    description,
    subtitle,
    eventType,
    const DeepCollectionEquality().hash(_userEvents),
    const DeepCollectionEquality().hash(_eventGuests),
  );

  /// Create a copy of EventResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventResponseImplCopyWith<_$EventResponseImpl> get copyWith =>
      __$$EventResponseImplCopyWithImpl<_$EventResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventResponseImplToJson(this);
  }
}

abstract class _EventResponse implements EventResponse {
  const factory _EventResponse({
    @JsonKey(name: "id") required final int id,
    @JsonKey(name: "name") required final String name,
    @JsonKey(name: "start_date") required final String startDate,
    @JsonKey(name: "end_date") required final String endDate,
    @JsonKey(name: "location") required final String location,
    @JsonKey(name: "latitude") required final String latitude,
    @JsonKey(name: "longitude") required final String longitude,
    @JsonKey(name: "description") required final String description,
    @JsonKey(name: "subtitle") required final String subtitle,
    @JsonKey(name: "event_type") required final String eventType,
    @JsonKey(name: "userevent")
    required final List<UserEventResponse> userEvents,
    @JsonKey(name: "eventguest")
    required final List<EventGuestResponse> eventGuests,
  }) = _$EventResponseImpl;

  factory _EventResponse.fromJson(Map<String, dynamic> json) =
      _$EventResponseImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "start_date")
  String get startDate;
  @override
  @JsonKey(name: "end_date")
  String get endDate;
  @override
  @JsonKey(name: "location")
  String get location;
  @override
  @JsonKey(name: "latitude")
  String get latitude;
  @override
  @JsonKey(name: "longitude")
  String get longitude;
  @override
  @JsonKey(name: "description")
  String get description;
  @override
  @JsonKey(name: "subtitle")
  String get subtitle;
  @override
  @JsonKey(name: "event_type")
  String get eventType;
  @override
  @JsonKey(name: "userevent")
  List<UserEventResponse> get userEvents;
  @override
  @JsonKey(name: "eventguest")
  List<EventGuestResponse> get eventGuests;

  /// Create a copy of EventResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventResponseImplCopyWith<_$EventResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserEventResponse _$UserEventResponseFromJson(Map<String, dynamic> json) {
  return _UserEventResponse.fromJson(json);
}

/// @nodoc
mixin _$UserEventResponse {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "uid")
  int get uid => throw _privateConstructorUsedError;
  @JsonKey(name: "event_id")
  int get eventId => throw _privateConstructorUsedError;
  @JsonKey(name: "time")
  String get time => throw _privateConstructorUsedError;
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
  @JsonKey(name: "user")
  EventUserResponse get user => throw _privateConstructorUsedError;

  /// Serializes this UserEventResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserEventResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserEventResponseCopyWith<UserEventResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventResponseCopyWith<$Res> {
  factory $UserEventResponseCopyWith(
    UserEventResponse value,
    $Res Function(UserEventResponse) then,
  ) = _$UserEventResponseCopyWithImpl<$Res, UserEventResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "id") int id,
    @JsonKey(name: "uid") int uid,
    @JsonKey(name: "event_id") int eventId,
    @JsonKey(name: "time") String time,
    @JsonKey(name: "pre_survey") dynamic preSurvey,
    @JsonKey(name: "survey") dynamic survey,
    @JsonKey(name: "post_survey") dynamic postSurvey,
    @JsonKey(name: "pre_survey_submitted") bool preSurveySubmitted,
    @JsonKey(name: "survey_submitted") bool surveySubmitted,
    @JsonKey(name: "post_survey_submitted") bool postSurveySubmitted,
    @JsonKey(name: "user") EventUserResponse user,
  });

  $EventUserResponseCopyWith<$Res> get user;
}

/// @nodoc
class _$UserEventResponseCopyWithImpl<$Res, $Val extends UserEventResponse>
    implements $UserEventResponseCopyWith<$Res> {
  _$UserEventResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserEventResponse
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
    Object? user = null,
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
                      as String,
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
            user: null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as EventUserResponse,
          )
          as $Val,
    );
  }

  /// Create a copy of UserEventResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EventUserResponseCopyWith<$Res> get user {
    return $EventUserResponseCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserEventResponseImplCopyWith<$Res>
    implements $UserEventResponseCopyWith<$Res> {
  factory _$$UserEventResponseImplCopyWith(
    _$UserEventResponseImpl value,
    $Res Function(_$UserEventResponseImpl) then,
  ) = __$$UserEventResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "id") int id,
    @JsonKey(name: "uid") int uid,
    @JsonKey(name: "event_id") int eventId,
    @JsonKey(name: "time") String time,
    @JsonKey(name: "pre_survey") dynamic preSurvey,
    @JsonKey(name: "survey") dynamic survey,
    @JsonKey(name: "post_survey") dynamic postSurvey,
    @JsonKey(name: "pre_survey_submitted") bool preSurveySubmitted,
    @JsonKey(name: "survey_submitted") bool surveySubmitted,
    @JsonKey(name: "post_survey_submitted") bool postSurveySubmitted,
    @JsonKey(name: "user") EventUserResponse user,
  });

  @override
  $EventUserResponseCopyWith<$Res> get user;
}

/// @nodoc
class __$$UserEventResponseImplCopyWithImpl<$Res>
    extends _$UserEventResponseCopyWithImpl<$Res, _$UserEventResponseImpl>
    implements _$$UserEventResponseImplCopyWith<$Res> {
  __$$UserEventResponseImplCopyWithImpl(
    _$UserEventResponseImpl _value,
    $Res Function(_$UserEventResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserEventResponse
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
    Object? user = null,
  }) {
    return _then(
      _$UserEventResponseImpl(
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
                  as String,
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
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as EventUserResponse,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserEventResponseImpl implements _UserEventResponse {
  const _$UserEventResponseImpl({
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
    @JsonKey(name: "user") required this.user,
  });

  factory _$UserEventResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserEventResponseImplFromJson(json);

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
  final String time;
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
  @JsonKey(name: "user")
  final EventUserResponse user;

  @override
  String toString() {
    return 'UserEventResponse(id: $id, uid: $uid, eventId: $eventId, time: $time, preSurvey: $preSurvey, survey: $survey, postSurvey: $postSurvey, preSurveySubmitted: $preSurveySubmitted, surveySubmitted: $surveySubmitted, postSurveySubmitted: $postSurveySubmitted, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEventResponseImpl &&
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
                other.postSurveySubmitted == postSurveySubmitted) &&
            (identical(other.user, user) || other.user == user));
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
    user,
  );

  /// Create a copy of UserEventResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEventResponseImplCopyWith<_$UserEventResponseImpl> get copyWith =>
      __$$UserEventResponseImplCopyWithImpl<_$UserEventResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserEventResponseImplToJson(this);
  }
}

abstract class _UserEventResponse implements UserEventResponse {
  const factory _UserEventResponse({
    @JsonKey(name: "id") required final int id,
    @JsonKey(name: "uid") required final int uid,
    @JsonKey(name: "event_id") required final int eventId,
    @JsonKey(name: "time") required final String time,
    @JsonKey(name: "pre_survey") final dynamic preSurvey,
    @JsonKey(name: "survey") final dynamic survey,
    @JsonKey(name: "post_survey") final dynamic postSurvey,
    @JsonKey(name: "pre_survey_submitted")
    required final bool preSurveySubmitted,
    @JsonKey(name: "survey_submitted") required final bool surveySubmitted,
    @JsonKey(name: "post_survey_submitted")
    required final bool postSurveySubmitted,
    @JsonKey(name: "user") required final EventUserResponse user,
  }) = _$UserEventResponseImpl;

  factory _UserEventResponse.fromJson(Map<String, dynamic> json) =
      _$UserEventResponseImpl.fromJson;

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
  String get time;
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
  @override
  @JsonKey(name: "user")
  EventUserResponse get user;

  /// Create a copy of UserEventResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserEventResponseImplCopyWith<_$UserEventResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EventUserResponse _$EventUserResponseFromJson(Map<String, dynamic> json) {
  return _EventUserResponse.fromJson(json);
}

/// @nodoc
mixin _$EventUserResponse {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "fullName")
  String get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String get email => throw _privateConstructorUsedError;

  /// Serializes this EventUserResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventUserResponseCopyWith<EventUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventUserResponseCopyWith<$Res> {
  factory $EventUserResponseCopyWith(
    EventUserResponse value,
    $Res Function(EventUserResponse) then,
  ) = _$EventUserResponseCopyWithImpl<$Res, EventUserResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "id") int id,
    @JsonKey(name: "fullName") String fullName,
    @JsonKey(name: "email") String email,
  });
}

/// @nodoc
class _$EventUserResponseCopyWithImpl<$Res, $Val extends EventUserResponse>
    implements $EventUserResponseCopyWith<$Res> {
  _$EventUserResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? email = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            fullName: null == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EventUserResponseImplCopyWith<$Res>
    implements $EventUserResponseCopyWith<$Res> {
  factory _$$EventUserResponseImplCopyWith(
    _$EventUserResponseImpl value,
    $Res Function(_$EventUserResponseImpl) then,
  ) = __$$EventUserResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "id") int id,
    @JsonKey(name: "fullName") String fullName,
    @JsonKey(name: "email") String email,
  });
}

/// @nodoc
class __$$EventUserResponseImplCopyWithImpl<$Res>
    extends _$EventUserResponseCopyWithImpl<$Res, _$EventUserResponseImpl>
    implements _$$EventUserResponseImplCopyWith<$Res> {
  __$$EventUserResponseImplCopyWithImpl(
    _$EventUserResponseImpl _value,
    $Res Function(_$EventUserResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EventUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? email = null,
  }) {
    return _then(
      _$EventUserResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        fullName: null == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EventUserResponseImpl implements _EventUserResponse {
  const _$EventUserResponseImpl({
    @JsonKey(name: "id") required this.id,
    @JsonKey(name: "fullName") required this.fullName,
    @JsonKey(name: "email") required this.email,
  });

  factory _$EventUserResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventUserResponseImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "fullName")
  final String fullName;
  @override
  @JsonKey(name: "email")
  final String email;

  @override
  String toString() {
    return 'EventUserResponse(id: $id, fullName: $fullName, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventUserResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, fullName, email);

  /// Create a copy of EventUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventUserResponseImplCopyWith<_$EventUserResponseImpl> get copyWith =>
      __$$EventUserResponseImplCopyWithImpl<_$EventUserResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EventUserResponseImplToJson(this);
  }
}

abstract class _EventUserResponse implements EventUserResponse {
  const factory _EventUserResponse({
    @JsonKey(name: "id") required final int id,
    @JsonKey(name: "fullName") required final String fullName,
    @JsonKey(name: "email") required final String email,
  }) = _$EventUserResponseImpl;

  factory _EventUserResponse.fromJson(Map<String, dynamic> json) =
      _$EventUserResponseImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "fullName")
  String get fullName;
  @override
  @JsonKey(name: "email")
  String get email;

  /// Create a copy of EventUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventUserResponseImplCopyWith<_$EventUserResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EventGuestResponse _$EventGuestResponseFromJson(Map<String, dynamic> json) {
  return _EventGuestResponse.fromJson(json);
}

/// @nodoc
mixin _$EventGuestResponse {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;

  /// Serializes this EventGuestResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventGuestResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventGuestResponseCopyWith<EventGuestResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventGuestResponseCopyWith<$Res> {
  factory $EventGuestResponseCopyWith(
    EventGuestResponse value,
    $Res Function(EventGuestResponse) then,
  ) = _$EventGuestResponseCopyWithImpl<$Res, EventGuestResponse>;
  @useResult
  $Res call({@JsonKey(name: "id") int id, @JsonKey(name: "name") String name});
}

/// @nodoc
class _$EventGuestResponseCopyWithImpl<$Res, $Val extends EventGuestResponse>
    implements $EventGuestResponseCopyWith<$Res> {
  _$EventGuestResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventGuestResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EventGuestResponseImplCopyWith<$Res>
    implements $EventGuestResponseCopyWith<$Res> {
  factory _$$EventGuestResponseImplCopyWith(
    _$EventGuestResponseImpl value,
    $Res Function(_$EventGuestResponseImpl) then,
  ) = __$$EventGuestResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "id") int id, @JsonKey(name: "name") String name});
}

/// @nodoc
class __$$EventGuestResponseImplCopyWithImpl<$Res>
    extends _$EventGuestResponseCopyWithImpl<$Res, _$EventGuestResponseImpl>
    implements _$$EventGuestResponseImplCopyWith<$Res> {
  __$$EventGuestResponseImplCopyWithImpl(
    _$EventGuestResponseImpl _value,
    $Res Function(_$EventGuestResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EventGuestResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
    return _then(
      _$EventGuestResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EventGuestResponseImpl implements _EventGuestResponse {
  const _$EventGuestResponseImpl({
    @JsonKey(name: "id") required this.id,
    @JsonKey(name: "name") required this.name,
  });

  factory _$EventGuestResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventGuestResponseImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "name")
  final String name;

  @override
  String toString() {
    return 'EventGuestResponse(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventGuestResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of EventGuestResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventGuestResponseImplCopyWith<_$EventGuestResponseImpl> get copyWith =>
      __$$EventGuestResponseImplCopyWithImpl<_$EventGuestResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EventGuestResponseImplToJson(this);
  }
}

abstract class _EventGuestResponse implements EventGuestResponse {
  const factory _EventGuestResponse({
    @JsonKey(name: "id") required final int id,
    @JsonKey(name: "name") required final String name,
  }) = _$EventGuestResponseImpl;

  factory _EventGuestResponse.fromJson(Map<String, dynamic> json) =
      _$EventGuestResponseImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "name")
  String get name;

  /// Create a copy of EventGuestResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventGuestResponseImplCopyWith<_$EventGuestResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
