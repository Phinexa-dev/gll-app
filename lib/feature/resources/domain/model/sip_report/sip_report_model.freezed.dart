// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sip_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SipReportModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String? get link => throw _privateConstructorUsedError;

  /// Create a copy of SipReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SipReportModelCopyWith<SipReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SipReportModelCopyWith<$Res> {
  factory $SipReportModelCopyWith(
          SipReportModel value, $Res Function(SipReportModel) then) =
      _$SipReportModelCopyWithImpl<$Res, SipReportModel>;
  @useResult
  $Res call(
      {int id, String title, String description, String image, String? link});
}

/// @nodoc
class _$SipReportModelCopyWithImpl<$Res, $Val extends SipReportModel>
    implements $SipReportModelCopyWith<$Res> {
  _$SipReportModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SipReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? image = null,
    Object? link = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SipReportModelImplCopyWith<$Res>
    implements $SipReportModelCopyWith<$Res> {
  factory _$$SipReportModelImplCopyWith(_$SipReportModelImpl value,
          $Res Function(_$SipReportModelImpl) then) =
      __$$SipReportModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String title, String description, String image, String? link});
}

/// @nodoc
class __$$SipReportModelImplCopyWithImpl<$Res>
    extends _$SipReportModelCopyWithImpl<$Res, _$SipReportModelImpl>
    implements _$$SipReportModelImplCopyWith<$Res> {
  __$$SipReportModelImplCopyWithImpl(
      _$SipReportModelImpl _value, $Res Function(_$SipReportModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SipReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? image = null,
    Object? link = freezed,
  }) {
    return _then(_$SipReportModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SipReportModelImpl implements _SipReportModel {
  const _$SipReportModelImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.image,
      this.link});

  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String image;
  @override
  final String? link;

  @override
  String toString() {
    return 'SipReportModel(id: $id, title: $title, description: $description, image: $image, link: $link)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SipReportModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.link, link) || other.link == link));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, description, image, link);

  /// Create a copy of SipReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SipReportModelImplCopyWith<_$SipReportModelImpl> get copyWith =>
      __$$SipReportModelImplCopyWithImpl<_$SipReportModelImpl>(
          this, _$identity);
}

abstract class _SipReportModel implements SipReportModel {
  const factory _SipReportModel(
      {required final int id,
      required final String title,
      required final String description,
      required final String image,
      final String? link}) = _$SipReportModelImpl;

  @override
  int get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get image;
  @override
  String? get link;

  /// Create a copy of SipReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SipReportModelImplCopyWith<_$SipReportModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
