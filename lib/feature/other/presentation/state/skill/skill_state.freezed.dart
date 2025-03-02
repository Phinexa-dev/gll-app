// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'skill_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SkillState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool? get isSuccess => throw _privateConstructorUsedError;
  bool? get isFailure => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  Map<String, dynamic>? get form => throw _privateConstructorUsedError;
  List<SkillDataModel> get skills => throw _privateConstructorUsedError;

  /// Create a copy of SkillState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SkillStateCopyWith<SkillState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkillStateCopyWith<$Res> {
  factory $SkillStateCopyWith(
          SkillState value, $Res Function(SkillState) then) =
      _$SkillStateCopyWithImpl<$Res, SkillState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool? isSuccess,
      bool? isFailure,
      String? errorMessage,
      Map<String, dynamic>? form,
      List<SkillDataModel> skills});
}

/// @nodoc
class _$SkillStateCopyWithImpl<$Res, $Val extends SkillState>
    implements $SkillStateCopyWith<$Res> {
  _$SkillStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SkillState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = freezed,
    Object? isFailure = freezed,
    Object? errorMessage = freezed,
    Object? form = freezed,
    Object? skills = null,
  }) {
    return _then(_value.copyWith(
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
      skills: null == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<SkillDataModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SkillStateImplCopyWith<$Res>
    implements $SkillStateCopyWith<$Res> {
  factory _$$SkillStateImplCopyWith(
          _$SkillStateImpl value, $Res Function(_$SkillStateImpl) then) =
      __$$SkillStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool? isSuccess,
      bool? isFailure,
      String? errorMessage,
      Map<String, dynamic>? form,
      List<SkillDataModel> skills});
}

/// @nodoc
class __$$SkillStateImplCopyWithImpl<$Res>
    extends _$SkillStateCopyWithImpl<$Res, _$SkillStateImpl>
    implements _$$SkillStateImplCopyWith<$Res> {
  __$$SkillStateImplCopyWithImpl(
      _$SkillStateImpl _value, $Res Function(_$SkillStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SkillState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = freezed,
    Object? isFailure = freezed,
    Object? errorMessage = freezed,
    Object? form = freezed,
    Object? skills = null,
  }) {
    return _then(_$SkillStateImpl(
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
      skills: null == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<SkillDataModel>,
    ));
  }
}

/// @nodoc

class _$SkillStateImpl implements _SkillState {
  _$SkillStateImpl(
      {this.isLoading = false,
      this.isSuccess,
      this.isFailure,
      this.errorMessage,
      final Map<String, dynamic>? form = const {},
      final List<SkillDataModel> skills = const []})
      : _form = form,
        _skills = skills;

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

  final List<SkillDataModel> _skills;
  @override
  @JsonKey()
  List<SkillDataModel> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  @override
  String toString() {
    return 'SkillState(isLoading: $isLoading, isSuccess: $isSuccess, isFailure: $isFailure, errorMessage: $errorMessage, form: $form, skills: $skills)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkillStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isFailure, isFailure) ||
                other.isFailure == isFailure) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._form, _form) &&
            const DeepCollectionEquality().equals(other._skills, _skills));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isSuccess,
      isFailure,
      errorMessage,
      const DeepCollectionEquality().hash(_form),
      const DeepCollectionEquality().hash(_skills));

  /// Create a copy of SkillState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SkillStateImplCopyWith<_$SkillStateImpl> get copyWith =>
      __$$SkillStateImplCopyWithImpl<_$SkillStateImpl>(this, _$identity);
}

abstract class _SkillState implements SkillState {
  factory _SkillState(
      {final bool isLoading,
      final bool? isSuccess,
      final bool? isFailure,
      final String? errorMessage,
      final Map<String, dynamic>? form,
      final List<SkillDataModel> skills}) = _$SkillStateImpl;

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
  List<SkillDataModel> get skills;

  /// Create a copy of SkillState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SkillStateImplCopyWith<_$SkillStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
