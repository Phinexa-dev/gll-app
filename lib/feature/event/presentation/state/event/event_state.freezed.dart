// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$EventState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool? get isSuccess => throw _privateConstructorUsedError;
  bool? get isFailure => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  List<EventDataModel> get events => throw _privateConstructorUsedError;
  EventDataModel? get selectedEvent => throw _privateConstructorUsedError;

  /// Create a copy of EventState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventStateCopyWith<EventState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventStateCopyWith<$Res> {
  factory $EventStateCopyWith(
    EventState value,
    $Res Function(EventState) then,
  ) = _$EventStateCopyWithImpl<$Res, EventState>;
  @useResult
  $Res call({
    bool isLoading,
    bool? isSuccess,
    bool? isFailure,
    String? errorMessage,
    List<EventDataModel> events,
    EventDataModel? selectedEvent,
  });

  $EventDataModelCopyWith<$Res>? get selectedEvent;
}

/// @nodoc
class _$EventStateCopyWithImpl<$Res, $Val extends EventState>
    implements $EventStateCopyWith<$Res> {
  _$EventStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = freezed,
    Object? isFailure = freezed,
    Object? errorMessage = freezed,
    Object? events = null,
    Object? selectedEvent = freezed,
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
            events: null == events
                ? _value.events
                : events // ignore: cast_nullable_to_non_nullable
                      as List<EventDataModel>,
            selectedEvent: freezed == selectedEvent
                ? _value.selectedEvent
                : selectedEvent // ignore: cast_nullable_to_non_nullable
                      as EventDataModel?,
          )
          as $Val,
    );
  }

  /// Create a copy of EventState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EventDataModelCopyWith<$Res>? get selectedEvent {
    if (_value.selectedEvent == null) {
      return null;
    }

    return $EventDataModelCopyWith<$Res>(_value.selectedEvent!, (value) {
      return _then(_value.copyWith(selectedEvent: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EventStateImplCopyWith<$Res>
    implements $EventStateCopyWith<$Res> {
  factory _$$EventStateImplCopyWith(
    _$EventStateImpl value,
    $Res Function(_$EventStateImpl) then,
  ) = __$$EventStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    bool? isSuccess,
    bool? isFailure,
    String? errorMessage,
    List<EventDataModel> events,
    EventDataModel? selectedEvent,
  });

  @override
  $EventDataModelCopyWith<$Res>? get selectedEvent;
}

/// @nodoc
class __$$EventStateImplCopyWithImpl<$Res>
    extends _$EventStateCopyWithImpl<$Res, _$EventStateImpl>
    implements _$$EventStateImplCopyWith<$Res> {
  __$$EventStateImplCopyWithImpl(
    _$EventStateImpl _value,
    $Res Function(_$EventStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EventState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = freezed,
    Object? isFailure = freezed,
    Object? errorMessage = freezed,
    Object? events = null,
    Object? selectedEvent = freezed,
  }) {
    return _then(
      _$EventStateImpl(
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
        events: null == events
            ? _value._events
            : events // ignore: cast_nullable_to_non_nullable
                  as List<EventDataModel>,
        selectedEvent: freezed == selectedEvent
            ? _value.selectedEvent
            : selectedEvent // ignore: cast_nullable_to_non_nullable
                  as EventDataModel?,
      ),
    );
  }
}

/// @nodoc

class _$EventStateImpl implements _EventState {
  _$EventStateImpl({
    this.isLoading = false,
    this.isSuccess,
    this.isFailure,
    this.errorMessage,
    final List<EventDataModel> events = const [],
    this.selectedEvent,
  }) : _events = events;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final bool? isSuccess;
  @override
  final bool? isFailure;
  @override
  final String? errorMessage;
  final List<EventDataModel> _events;
  @override
  @JsonKey()
  List<EventDataModel> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  final EventDataModel? selectedEvent;

  @override
  String toString() {
    return 'EventState(isLoading: $isLoading, isSuccess: $isSuccess, isFailure: $isFailure, errorMessage: $errorMessage, events: $events, selectedEvent: $selectedEvent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isFailure, isFailure) ||
                other.isFailure == isFailure) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.selectedEvent, selectedEvent) ||
                other.selectedEvent == selectedEvent));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    isSuccess,
    isFailure,
    errorMessage,
    const DeepCollectionEquality().hash(_events),
    selectedEvent,
  );

  /// Create a copy of EventState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventStateImplCopyWith<_$EventStateImpl> get copyWith =>
      __$$EventStateImplCopyWithImpl<_$EventStateImpl>(this, _$identity);
}

abstract class _EventState implements EventState {
  factory _EventState({
    final bool isLoading,
    final bool? isSuccess,
    final bool? isFailure,
    final String? errorMessage,
    final List<EventDataModel> events,
    final EventDataModel? selectedEvent,
  }) = _$EventStateImpl;

  @override
  bool get isLoading;
  @override
  bool? get isSuccess;
  @override
  bool? get isFailure;
  @override
  String? get errorMessage;
  @override
  List<EventDataModel> get events;
  @override
  EventDataModel? get selectedEvent;

  /// Create a copy of EventState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventStateImplCopyWith<_$EventStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
