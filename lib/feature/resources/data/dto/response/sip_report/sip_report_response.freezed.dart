// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sip_report_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SipReportResponse _$SipReportResponseFromJson(Map<String, dynamic> json) {
  return _SipReportResponse.fromJson(json);
}

/// @nodoc
mixin _$SipReportResponse {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "image")
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: "link")
  String? get link => throw _privateConstructorUsedError;
  @JsonKey(name: "approved")
  int get approved => throw _privateConstructorUsedError;
  @JsonKey(name: "uid")
  int get uid => throw _privateConstructorUsedError;

  /// Serializes this SipReportResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SipReportResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SipReportResponseCopyWith<SipReportResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SipReportResponseCopyWith<$Res> {
  factory $SipReportResponseCopyWith(
    SipReportResponse value,
    $Res Function(SipReportResponse) then,
  ) = _$SipReportResponseCopyWithImpl<$Res, SipReportResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "id") int id,
    @JsonKey(name: "title") String title,
    @JsonKey(name: "description") String description,
    @JsonKey(name: "image") String image,
    @JsonKey(name: "link") String? link,
    @JsonKey(name: "approved") int approved,
    @JsonKey(name: "uid") int uid,
  });
}

/// @nodoc
class _$SipReportResponseCopyWithImpl<$Res, $Val extends SipReportResponse>
    implements $SipReportResponseCopyWith<$Res> {
  _$SipReportResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SipReportResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? image = null,
    Object? link = freezed,
    Object? approved = null,
    Object? uid = null,
  }) {
    return _then(
      _value.copyWith(
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
            approved: null == approved
                ? _value.approved
                : approved // ignore: cast_nullable_to_non_nullable
                      as int,
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
abstract class _$$SipReportResponseImplCopyWith<$Res>
    implements $SipReportResponseCopyWith<$Res> {
  factory _$$SipReportResponseImplCopyWith(
    _$SipReportResponseImpl value,
    $Res Function(_$SipReportResponseImpl) then,
  ) = __$$SipReportResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "id") int id,
    @JsonKey(name: "title") String title,
    @JsonKey(name: "description") String description,
    @JsonKey(name: "image") String image,
    @JsonKey(name: "link") String? link,
    @JsonKey(name: "approved") int approved,
    @JsonKey(name: "uid") int uid,
  });
}

/// @nodoc
class __$$SipReportResponseImplCopyWithImpl<$Res>
    extends _$SipReportResponseCopyWithImpl<$Res, _$SipReportResponseImpl>
    implements _$$SipReportResponseImplCopyWith<$Res> {
  __$$SipReportResponseImplCopyWithImpl(
    _$SipReportResponseImpl _value,
    $Res Function(_$SipReportResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SipReportResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? image = null,
    Object? link = freezed,
    Object? approved = null,
    Object? uid = null,
  }) {
    return _then(
      _$SipReportResponseImpl(
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
        approved: null == approved
            ? _value.approved
            : approved // ignore: cast_nullable_to_non_nullable
                  as int,
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
class _$SipReportResponseImpl implements _SipReportResponse {
  const _$SipReportResponseImpl({
    @JsonKey(name: "id") required this.id,
    @JsonKey(name: "title") required this.title,
    @JsonKey(name: "description") required this.description,
    @JsonKey(name: "image") required this.image,
    @JsonKey(name: "link") this.link,
    @JsonKey(name: "approved") required this.approved,
    @JsonKey(name: "uid") required this.uid,
  });

  factory _$SipReportResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SipReportResponseImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "title")
  final String title;
  @override
  @JsonKey(name: "description")
  final String description;
  @override
  @JsonKey(name: "image")
  final String image;
  @override
  @JsonKey(name: "link")
  final String? link;
  @override
  @JsonKey(name: "approved")
  final int approved;
  @override
  @JsonKey(name: "uid")
  final int uid;

  @override
  String toString() {
    return 'SipReportResponse(id: $id, title: $title, description: $description, image: $image, link: $link, approved: $approved, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SipReportResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.approved, approved) ||
                other.approved == approved) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    description,
    image,
    link,
    approved,
    uid,
  );

  /// Create a copy of SipReportResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SipReportResponseImplCopyWith<_$SipReportResponseImpl> get copyWith =>
      __$$SipReportResponseImplCopyWithImpl<_$SipReportResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SipReportResponseImplToJson(this);
  }
}

abstract class _SipReportResponse implements SipReportResponse {
  const factory _SipReportResponse({
    @JsonKey(name: "id") required final int id,
    @JsonKey(name: "title") required final String title,
    @JsonKey(name: "description") required final String description,
    @JsonKey(name: "image") required final String image,
    @JsonKey(name: "link") final String? link,
    @JsonKey(name: "approved") required final int approved,
    @JsonKey(name: "uid") required final int uid,
  }) = _$SipReportResponseImpl;

  factory _SipReportResponse.fromJson(Map<String, dynamic> json) =
      _$SipReportResponseImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "title")
  String get title;
  @override
  @JsonKey(name: "description")
  String get description;
  @override
  @JsonKey(name: "image")
  String get image;
  @override
  @JsonKey(name: "link")
  String? get link;
  @override
  @JsonKey(name: "approved")
  int get approved;
  @override
  @JsonKey(name: "uid")
  int get uid;

  /// Create a copy of SipReportResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SipReportResponseImplCopyWith<_$SipReportResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
