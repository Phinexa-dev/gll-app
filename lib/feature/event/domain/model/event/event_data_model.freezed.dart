// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$EventDataModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get latitude => throw _privateConstructorUsedError;
  String get longitude => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get subtitle => throw _privateConstructorUsedError;
  String get eventType => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  List<UserEventDataModel> get userEvents => throw _privateConstructorUsedError;
  List<EventGuestDataModel> get eventGuests =>
      throw _privateConstructorUsedError;

  /// Create a copy of EventDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventDataModelCopyWith<EventDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventDataModelCopyWith<$Res> {
  factory $EventDataModelCopyWith(
    EventDataModel value,
    $Res Function(EventDataModel) then,
  ) = _$EventDataModelCopyWithImpl<$Res, EventDataModel>;
  @useResult
  $Res call({
    int id,
    String name,
    DateTime startDate,
    DateTime endDate,
    String location,
    String latitude,
    String longitude,
    String description,
    String subtitle,
    String eventType,
    String image,
    List<UserEventDataModel> userEvents,
    List<EventGuestDataModel> eventGuests,
  });
}

/// @nodoc
class _$EventDataModelCopyWithImpl<$Res, $Val extends EventDataModel>
    implements $EventDataModelCopyWith<$Res> {
  _$EventDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventDataModel
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
    Object? image = null,
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
                      as DateTime,
            endDate: null == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
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
            image: null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String,
            userEvents: null == userEvents
                ? _value.userEvents
                : userEvents // ignore: cast_nullable_to_non_nullable
                      as List<UserEventDataModel>,
            eventGuests: null == eventGuests
                ? _value.eventGuests
                : eventGuests // ignore: cast_nullable_to_non_nullable
                      as List<EventGuestDataModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EventDataModelImplCopyWith<$Res>
    implements $EventDataModelCopyWith<$Res> {
  factory _$$EventDataModelImplCopyWith(
    _$EventDataModelImpl value,
    $Res Function(_$EventDataModelImpl) then,
  ) = __$$EventDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    DateTime startDate,
    DateTime endDate,
    String location,
    String latitude,
    String longitude,
    String description,
    String subtitle,
    String eventType,
    String image,
    List<UserEventDataModel> userEvents,
    List<EventGuestDataModel> eventGuests,
  });
}

/// @nodoc
class __$$EventDataModelImplCopyWithImpl<$Res>
    extends _$EventDataModelCopyWithImpl<$Res, _$EventDataModelImpl>
    implements _$$EventDataModelImplCopyWith<$Res> {
  __$$EventDataModelImplCopyWithImpl(
    _$EventDataModelImpl _value,
    $Res Function(_$EventDataModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EventDataModel
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
    Object? image = null,
    Object? userEvents = null,
    Object? eventGuests = null,
  }) {
    return _then(
      _$EventDataModelImpl(
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
                  as DateTime,
        endDate: null == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
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
        image: null == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String,
        userEvents: null == userEvents
            ? _value._userEvents
            : userEvents // ignore: cast_nullable_to_non_nullable
                  as List<UserEventDataModel>,
        eventGuests: null == eventGuests
            ? _value._eventGuests
            : eventGuests // ignore: cast_nullable_to_non_nullable
                  as List<EventGuestDataModel>,
      ),
    );
  }
}

/// @nodoc

class _$EventDataModelImpl implements _EventDataModel {
  const _$EventDataModelImpl({
    required this.id,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.description,
    required this.subtitle,
    required this.eventType,
    required this.image,
    required final List<UserEventDataModel> userEvents,
    required final List<EventGuestDataModel> eventGuests,
  }) : _userEvents = userEvents,
       _eventGuests = eventGuests;

  @override
  final int id;
  @override
  final String name;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final String location;
  @override
  final String latitude;
  @override
  final String longitude;
  @override
  final String description;
  @override
  final String subtitle;
  @override
  final String eventType;
  @override
  final String image;
  final List<UserEventDataModel> _userEvents;
  @override
  List<UserEventDataModel> get userEvents {
    if (_userEvents is EqualUnmodifiableListView) return _userEvents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userEvents);
  }

  final List<EventGuestDataModel> _eventGuests;
  @override
  List<EventGuestDataModel> get eventGuests {
    if (_eventGuests is EqualUnmodifiableListView) return _eventGuests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_eventGuests);
  }

  @override
  String toString() {
    return 'EventDataModel(id: $id, name: $name, startDate: $startDate, endDate: $endDate, location: $location, latitude: $latitude, longitude: $longitude, description: $description, subtitle: $subtitle, eventType: $eventType, image: $image, userEvents: $userEvents, eventGuests: $eventGuests)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventDataModelImpl &&
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
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(
              other._userEvents,
              _userEvents,
            ) &&
            const DeepCollectionEquality().equals(
              other._eventGuests,
              _eventGuests,
            ));
  }

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
    image,
    const DeepCollectionEquality().hash(_userEvents),
    const DeepCollectionEquality().hash(_eventGuests),
  );

  /// Create a copy of EventDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventDataModelImplCopyWith<_$EventDataModelImpl> get copyWith =>
      __$$EventDataModelImplCopyWithImpl<_$EventDataModelImpl>(
        this,
        _$identity,
      );
}

abstract class _EventDataModel implements EventDataModel {
  const factory _EventDataModel({
    required final int id,
    required final String name,
    required final DateTime startDate,
    required final DateTime endDate,
    required final String location,
    required final String latitude,
    required final String longitude,
    required final String description,
    required final String subtitle,
    required final String eventType,
    required final String image,
    required final List<UserEventDataModel> userEvents,
    required final List<EventGuestDataModel> eventGuests,
  }) = _$EventDataModelImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  String get location;
  @override
  String get latitude;
  @override
  String get longitude;
  @override
  String get description;
  @override
  String get subtitle;
  @override
  String get eventType;
  @override
  String get image;
  @override
  List<UserEventDataModel> get userEvents;
  @override
  List<EventGuestDataModel> get eventGuests;

  /// Create a copy of EventDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventDataModelImplCopyWith<_$EventDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserEventDataModel {
  int get id => throw _privateConstructorUsedError;
  int get uid => throw _privateConstructorUsedError;
  int get eventId => throw _privateConstructorUsedError;
  DateTime get time => throw _privateConstructorUsedError;
  dynamic get preSurvey => throw _privateConstructorUsedError;
  dynamic get survey => throw _privateConstructorUsedError;
  dynamic get postSurvey => throw _privateConstructorUsedError;
  bool get preSurveySubmitted => throw _privateConstructorUsedError;
  bool get surveySubmitted => throw _privateConstructorUsedError;
  bool get postSurveySubmitted => throw _privateConstructorUsedError;
  EventUserDataModel get user => throw _privateConstructorUsedError;

  /// Create a copy of UserEventDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserEventDataModelCopyWith<UserEventDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventDataModelCopyWith<$Res> {
  factory $UserEventDataModelCopyWith(
    UserEventDataModel value,
    $Res Function(UserEventDataModel) then,
  ) = _$UserEventDataModelCopyWithImpl<$Res, UserEventDataModel>;
  @useResult
  $Res call({
    int id,
    int uid,
    int eventId,
    DateTime time,
    dynamic preSurvey,
    dynamic survey,
    dynamic postSurvey,
    bool preSurveySubmitted,
    bool surveySubmitted,
    bool postSurveySubmitted,
    EventUserDataModel user,
  });

  $EventUserDataModelCopyWith<$Res> get user;
}

/// @nodoc
class _$UserEventDataModelCopyWithImpl<$Res, $Val extends UserEventDataModel>
    implements $UserEventDataModelCopyWith<$Res> {
  _$UserEventDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserEventDataModel
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
            user: null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as EventUserDataModel,
          )
          as $Val,
    );
  }

  /// Create a copy of UserEventDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EventUserDataModelCopyWith<$Res> get user {
    return $EventUserDataModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserEventDataModelImplCopyWith<$Res>
    implements $UserEventDataModelCopyWith<$Res> {
  factory _$$UserEventDataModelImplCopyWith(
    _$UserEventDataModelImpl value,
    $Res Function(_$UserEventDataModelImpl) then,
  ) = __$$UserEventDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int uid,
    int eventId,
    DateTime time,
    dynamic preSurvey,
    dynamic survey,
    dynamic postSurvey,
    bool preSurveySubmitted,
    bool surveySubmitted,
    bool postSurveySubmitted,
    EventUserDataModel user,
  });

  @override
  $EventUserDataModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$UserEventDataModelImplCopyWithImpl<$Res>
    extends _$UserEventDataModelCopyWithImpl<$Res, _$UserEventDataModelImpl>
    implements _$$UserEventDataModelImplCopyWith<$Res> {
  __$$UserEventDataModelImplCopyWithImpl(
    _$UserEventDataModelImpl _value,
    $Res Function(_$UserEventDataModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserEventDataModel
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
      _$UserEventDataModelImpl(
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
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as EventUserDataModel,
      ),
    );
  }
}

/// @nodoc

class _$UserEventDataModelImpl implements _UserEventDataModel {
  const _$UserEventDataModelImpl({
    required this.id,
    required this.uid,
    required this.eventId,
    required this.time,
    this.preSurvey,
    this.survey,
    this.postSurvey,
    required this.preSurveySubmitted,
    required this.surveySubmitted,
    required this.postSurveySubmitted,
    required this.user,
  });

  @override
  final int id;
  @override
  final int uid;
  @override
  final int eventId;
  @override
  final DateTime time;
  @override
  final dynamic preSurvey;
  @override
  final dynamic survey;
  @override
  final dynamic postSurvey;
  @override
  final bool preSurveySubmitted;
  @override
  final bool surveySubmitted;
  @override
  final bool postSurveySubmitted;
  @override
  final EventUserDataModel user;

  @override
  String toString() {
    return 'UserEventDataModel(id: $id, uid: $uid, eventId: $eventId, time: $time, preSurvey: $preSurvey, survey: $survey, postSurvey: $postSurvey, preSurveySubmitted: $preSurveySubmitted, surveySubmitted: $surveySubmitted, postSurveySubmitted: $postSurveySubmitted, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEventDataModelImpl &&
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

  /// Create a copy of UserEventDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEventDataModelImplCopyWith<_$UserEventDataModelImpl> get copyWith =>
      __$$UserEventDataModelImplCopyWithImpl<_$UserEventDataModelImpl>(
        this,
        _$identity,
      );
}

abstract class _UserEventDataModel implements UserEventDataModel {
  const factory _UserEventDataModel({
    required final int id,
    required final int uid,
    required final int eventId,
    required final DateTime time,
    final dynamic preSurvey,
    final dynamic survey,
    final dynamic postSurvey,
    required final bool preSurveySubmitted,
    required final bool surveySubmitted,
    required final bool postSurveySubmitted,
    required final EventUserDataModel user,
  }) = _$UserEventDataModelImpl;

  @override
  int get id;
  @override
  int get uid;
  @override
  int get eventId;
  @override
  DateTime get time;
  @override
  dynamic get preSurvey;
  @override
  dynamic get survey;
  @override
  dynamic get postSurvey;
  @override
  bool get preSurveySubmitted;
  @override
  bool get surveySubmitted;
  @override
  bool get postSurveySubmitted;
  @override
  EventUserDataModel get user;

  /// Create a copy of UserEventDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserEventDataModelImplCopyWith<_$UserEventDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EventUserDataModel {
  int get id => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  /// Create a copy of EventUserDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventUserDataModelCopyWith<EventUserDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventUserDataModelCopyWith<$Res> {
  factory $EventUserDataModelCopyWith(
    EventUserDataModel value,
    $Res Function(EventUserDataModel) then,
  ) = _$EventUserDataModelCopyWithImpl<$Res, EventUserDataModel>;
  @useResult
  $Res call({int id, String fullName, String email});
}

/// @nodoc
class _$EventUserDataModelCopyWithImpl<$Res, $Val extends EventUserDataModel>
    implements $EventUserDataModelCopyWith<$Res> {
  _$EventUserDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventUserDataModel
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
abstract class _$$EventUserDataModelImplCopyWith<$Res>
    implements $EventUserDataModelCopyWith<$Res> {
  factory _$$EventUserDataModelImplCopyWith(
    _$EventUserDataModelImpl value,
    $Res Function(_$EventUserDataModelImpl) then,
  ) = __$$EventUserDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String fullName, String email});
}

/// @nodoc
class __$$EventUserDataModelImplCopyWithImpl<$Res>
    extends _$EventUserDataModelCopyWithImpl<$Res, _$EventUserDataModelImpl>
    implements _$$EventUserDataModelImplCopyWith<$Res> {
  __$$EventUserDataModelImplCopyWithImpl(
    _$EventUserDataModelImpl _value,
    $Res Function(_$EventUserDataModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EventUserDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? email = null,
  }) {
    return _then(
      _$EventUserDataModelImpl(
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

class _$EventUserDataModelImpl implements _EventUserDataModel {
  const _$EventUserDataModelImpl({
    required this.id,
    required this.fullName,
    required this.email,
  });

  @override
  final int id;
  @override
  final String fullName;
  @override
  final String email;

  @override
  String toString() {
    return 'EventUserDataModel(id: $id, fullName: $fullName, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventUserDataModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, fullName, email);

  /// Create a copy of EventUserDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventUserDataModelImplCopyWith<_$EventUserDataModelImpl> get copyWith =>
      __$$EventUserDataModelImplCopyWithImpl<_$EventUserDataModelImpl>(
        this,
        _$identity,
      );
}

abstract class _EventUserDataModel implements EventUserDataModel {
  const factory _EventUserDataModel({
    required final int id,
    required final String fullName,
    required final String email,
  }) = _$EventUserDataModelImpl;

  @override
  int get id;
  @override
  String get fullName;
  @override
  String get email;

  /// Create a copy of EventUserDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventUserDataModelImplCopyWith<_$EventUserDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EventGuestDataModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Create a copy of EventGuestDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventGuestDataModelCopyWith<EventGuestDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventGuestDataModelCopyWith<$Res> {
  factory $EventGuestDataModelCopyWith(
    EventGuestDataModel value,
    $Res Function(EventGuestDataModel) then,
  ) = _$EventGuestDataModelCopyWithImpl<$Res, EventGuestDataModel>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$EventGuestDataModelCopyWithImpl<$Res, $Val extends EventGuestDataModel>
    implements $EventGuestDataModelCopyWith<$Res> {
  _$EventGuestDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventGuestDataModel
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
abstract class _$$EventGuestDataModelImplCopyWith<$Res>
    implements $EventGuestDataModelCopyWith<$Res> {
  factory _$$EventGuestDataModelImplCopyWith(
    _$EventGuestDataModelImpl value,
    $Res Function(_$EventGuestDataModelImpl) then,
  ) = __$$EventGuestDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$EventGuestDataModelImplCopyWithImpl<$Res>
    extends _$EventGuestDataModelCopyWithImpl<$Res, _$EventGuestDataModelImpl>
    implements _$$EventGuestDataModelImplCopyWith<$Res> {
  __$$EventGuestDataModelImplCopyWithImpl(
    _$EventGuestDataModelImpl _value,
    $Res Function(_$EventGuestDataModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EventGuestDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
    return _then(
      _$EventGuestDataModelImpl(
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

class _$EventGuestDataModelImpl implements _EventGuestDataModel {
  const _$EventGuestDataModelImpl({required this.id, required this.name});

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'EventGuestDataModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventGuestDataModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of EventGuestDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventGuestDataModelImplCopyWith<_$EventGuestDataModelImpl> get copyWith =>
      __$$EventGuestDataModelImplCopyWithImpl<_$EventGuestDataModelImpl>(
        this,
        _$identity,
      );
}

abstract class _EventGuestDataModel implements EventGuestDataModel {
  const factory _EventGuestDataModel({
    required final int id,
    required final String name,
  }) = _$EventGuestDataModelImpl;

  @override
  int get id;
  @override
  String get name;

  /// Create a copy of EventGuestDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventGuestDataModelImplCopyWith<_$EventGuestDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
