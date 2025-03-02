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
  dynamic get faceBook => throw _privateConstructorUsedError;
  @JsonKey(name: "blog")
  dynamic get blog => throw _privateConstructorUsedError;
  @JsonKey(name: "twitter")
  dynamic get twitter => throw _privateConstructorUsedError;
  @JsonKey(name: "x")
  dynamic get x => throw _privateConstructorUsedError;
  @JsonKey(name: "instagram")
  dynamic get instagram => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "faceBook") dynamic faceBook,
      @JsonKey(name: "blog") dynamic blog,
      @JsonKey(name: "twitter") dynamic twitter,
      @JsonKey(name: "x") dynamic x,
      @JsonKey(name: "instagram") dynamic instagram});
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
              as dynamic,
      blog: freezed == blog
          ? _value.blog
          : blog // ignore: cast_nullable_to_non_nullable
              as dynamic,
      twitter: freezed == twitter
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as dynamic,
      x: freezed == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as dynamic,
      instagram: freezed == instagram
          ? _value.instagram
          : instagram // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      {@JsonKey(name: "faceBook") dynamic faceBook,
      @JsonKey(name: "blog") dynamic blog,
      @JsonKey(name: "twitter") dynamic twitter,
      @JsonKey(name: "x") dynamic x,
      @JsonKey(name: "instagram") dynamic instagram});
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
              as dynamic,
      blog: freezed == blog
          ? _value.blog
          : blog // ignore: cast_nullable_to_non_nullable
              as dynamic,
      twitter: freezed == twitter
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as dynamic,
      x: freezed == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as dynamic,
      instagram: freezed == instagram
          ? _value.instagram
          : instagram // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
  final dynamic faceBook;
  @override
  @JsonKey(name: "blog")
  final dynamic blog;
  @override
  @JsonKey(name: "twitter")
  final dynamic twitter;
  @override
  @JsonKey(name: "x")
  final dynamic x;
  @override
  @JsonKey(name: "instagram")
  final dynamic instagram;

  @override
  String toString() {
    return 'EditSocialRequest(faceBook: $faceBook, blog: $blog, twitter: $twitter, x: $x, instagram: $instagram)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditSocialRequestImpl &&
            const DeepCollectionEquality().equals(other.faceBook, faceBook) &&
            const DeepCollectionEquality().equals(other.blog, blog) &&
            const DeepCollectionEquality().equals(other.twitter, twitter) &&
            const DeepCollectionEquality().equals(other.x, x) &&
            const DeepCollectionEquality().equals(other.instagram, instagram));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(faceBook),
      const DeepCollectionEquality().hash(blog),
      const DeepCollectionEquality().hash(twitter),
      const DeepCollectionEquality().hash(x),
      const DeepCollectionEquality().hash(instagram));

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
          {@JsonKey(name: "faceBook") final dynamic faceBook,
          @JsonKey(name: "blog") final dynamic blog,
          @JsonKey(name: "twitter") final dynamic twitter,
          @JsonKey(name: "x") final dynamic x,
          @JsonKey(name: "instagram") final dynamic instagram}) =
      _$EditSocialRequestImpl;

  factory _EditSocialRequest.fromJson(Map<String, dynamic> json) =
      _$EditSocialRequestImpl.fromJson;

  @override
  @JsonKey(name: "faceBook")
  dynamic get faceBook;
  @override
  @JsonKey(name: "blog")
  dynamic get blog;
  @override
  @JsonKey(name: "twitter")
  dynamic get twitter;
  @override
  @JsonKey(name: "x")
  dynamic get x;
  @override
  @JsonKey(name: "instagram")
  dynamic get instagram;

  /// Create a copy of EditSocialRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditSocialRequestImplCopyWith<_$EditSocialRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
