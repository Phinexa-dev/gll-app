// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_social_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EditSocialRequest _$EditSocialRequestFromJson(Map<String, dynamic> json) {
  return _EditSocialRequest.fromJson(json);
}

/// @nodoc
mixin _$EditSocialRequest {
  @JsonKey(name: "faceBook")
  String? get faceBook => throw _privateConstructorUsedError;
  @JsonKey(name: "blog")
  String? get blog => throw _privateConstructorUsedError;
  @JsonKey(name: "twitter")
  String? get twitter => throw _privateConstructorUsedError;
  @JsonKey(name: "x")
  String? get x => throw _privateConstructorUsedError;
  @JsonKey(name: "instagram")
  String? get instagram => throw _privateConstructorUsedError;

  /// Serializes this EditSocialRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EditSocialRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EditSocialRequestCopyWith<EditSocialRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditSocialRequestCopyWith<$Res> {
  factory $EditSocialRequestCopyWith(
          EditSocialRequest value, $Res Function(EditSocialRequest) then) =
      _$EditSocialRequestCopyWithImpl<$Res, EditSocialRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "faceBook") String? faceBook,
      @JsonKey(name: "blog") String? blog,
      @JsonKey(name: "twitter") String? twitter,
      @JsonKey(name: "x") String? x,
      @JsonKey(name: "instagram") String? instagram});
}

/// @nodoc
class _$EditSocialRequestCopyWithImpl<$Res, $Val extends EditSocialRequest>
    implements $EditSocialRequestCopyWith<$Res> {
  _$EditSocialRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditSocialRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? faceBook = freezed,
    Object? blog = freezed,
    Object? twitter = freezed,
    Object? x = freezed,
    Object? instagram = freezed,
  }) {
    return _then(_value.copyWith(
      faceBook: freezed == faceBook
          ? _value.faceBook
          : faceBook // ignore: cast_nullable_to_non_nullable
              as String?,
      blog: freezed == blog
          ? _value.blog
          : blog // ignore: cast_nullable_to_non_nullable
              as String?,
      twitter: freezed == twitter
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as String?,
      x: freezed == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as String?,
      instagram: freezed == instagram
          ? _value.instagram
          : instagram // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditSocialRequestImplCopyWith<$Res>
    implements $EditSocialRequestCopyWith<$Res> {
  factory _$$EditSocialRequestImplCopyWith(_$EditSocialRequestImpl value,
          $Res Function(_$EditSocialRequestImpl) then) =
      __$$EditSocialRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "faceBook") String? faceBook,
      @JsonKey(name: "blog") String? blog,
      @JsonKey(name: "twitter") String? twitter,
      @JsonKey(name: "x") String? x,
      @JsonKey(name: "instagram") String? instagram});
}

/// @nodoc
class __$$EditSocialRequestImplCopyWithImpl<$Res>
    extends _$EditSocialRequestCopyWithImpl<$Res, _$EditSocialRequestImpl>
    implements _$$EditSocialRequestImplCopyWith<$Res> {
  __$$EditSocialRequestImplCopyWithImpl(_$EditSocialRequestImpl _value,
      $Res Function(_$EditSocialRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditSocialRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? faceBook = freezed,
    Object? blog = freezed,
    Object? twitter = freezed,
    Object? x = freezed,
    Object? instagram = freezed,
  }) {
    return _then(_$EditSocialRequestImpl(
      faceBook: freezed == faceBook
          ? _value.faceBook
          : faceBook // ignore: cast_nullable_to_non_nullable
              as String?,
      blog: freezed == blog
          ? _value.blog
          : blog // ignore: cast_nullable_to_non_nullable
              as String?,
      twitter: freezed == twitter
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as String?,
      x: freezed == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as String?,
      instagram: freezed == instagram
          ? _value.instagram
          : instagram // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EditSocialRequestImpl implements _EditSocialRequest {
  const _$EditSocialRequestImpl(
      {@JsonKey(name: "faceBook") this.faceBook,
      @JsonKey(name: "blog") this.blog,
      @JsonKey(name: "twitter") this.twitter,
      @JsonKey(name: "x") this.x,
      @JsonKey(name: "instagram") this.instagram});

  factory _$EditSocialRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$EditSocialRequestImplFromJson(json);

  @override
  @JsonKey(name: "faceBook")
  final String? faceBook;
  @override
  @JsonKey(name: "blog")
  final String? blog;
  @override
  @JsonKey(name: "twitter")
  final String? twitter;
  @override
  @JsonKey(name: "x")
  final String? x;
  @override
  @JsonKey(name: "instagram")
  final String? instagram;

  @override
  String toString() {
    return 'EditSocialRequest(faceBook: $faceBook, blog: $blog, twitter: $twitter, x: $x, instagram: $instagram)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditSocialRequestImpl &&
            (identical(other.faceBook, faceBook) ||
                other.faceBook == faceBook) &&
            (identical(other.blog, blog) || other.blog == blog) &&
            (identical(other.twitter, twitter) || other.twitter == twitter) &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.instagram, instagram) ||
                other.instagram == instagram));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, faceBook, blog, twitter, x, instagram);

  /// Create a copy of EditSocialRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditSocialRequestImplCopyWith<_$EditSocialRequestImpl> get copyWith =>
      __$$EditSocialRequestImplCopyWithImpl<_$EditSocialRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EditSocialRequestImplToJson(
      this,
    );
  }
}

abstract class _EditSocialRequest implements EditSocialRequest {
  const factory _EditSocialRequest(
          {@JsonKey(name: "faceBook") final String? faceBook,
          @JsonKey(name: "blog") final String? blog,
          @JsonKey(name: "twitter") final String? twitter,
          @JsonKey(name: "x") final String? x,
          @JsonKey(name: "instagram") final String? instagram}) =
      _$EditSocialRequestImpl;

  factory _EditSocialRequest.fromJson(Map<String, dynamic> json) =
      _$EditSocialRequestImpl.fromJson;

  @override
  @JsonKey(name: "faceBook")
  String? get faceBook;
  @override
  @JsonKey(name: "blog")
  String? get blog;
  @override
  @JsonKey(name: "twitter")
  String? get twitter;
  @override
  @JsonKey(name: "x")
  String? get x;
  @override
  @JsonKey(name: "instagram")
  String? get instagram;

  /// Create a copy of EditSocialRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditSocialRequestImplCopyWith<_$EditSocialRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
