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

SipReportUserResponse _$SipReportUserResponseFromJson(
  Map<String, dynamic> json,
) {
  return _SipReportUserResponse.fromJson(json);
}

/// @nodoc
mixin _$SipReportUserResponse {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "fullName")
  String get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String get email => throw _privateConstructorUsedError;

  /// Serializes this SipReportUserResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SipReportUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SipReportUserResponseCopyWith<SipReportUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SipReportUserResponseCopyWith<$Res> {
  factory $SipReportUserResponseCopyWith(
    SipReportUserResponse value,
    $Res Function(SipReportUserResponse) then,
  ) = _$SipReportUserResponseCopyWithImpl<$Res, SipReportUserResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "id") int id,
    @JsonKey(name: "fullName") String fullName,
    @JsonKey(name: "email") String email,
  });
}

/// @nodoc
class _$SipReportUserResponseCopyWithImpl<
  $Res,
  $Val extends SipReportUserResponse
>
    implements $SipReportUserResponseCopyWith<$Res> {
  _$SipReportUserResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SipReportUserResponse
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
abstract class _$$SipReportUserResponseImplCopyWith<$Res>
    implements $SipReportUserResponseCopyWith<$Res> {
  factory _$$SipReportUserResponseImplCopyWith(
    _$SipReportUserResponseImpl value,
    $Res Function(_$SipReportUserResponseImpl) then,
  ) = __$$SipReportUserResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "id") int id,
    @JsonKey(name: "fullName") String fullName,
    @JsonKey(name: "email") String email,
  });
}

/// @nodoc
class __$$SipReportUserResponseImplCopyWithImpl<$Res>
    extends
        _$SipReportUserResponseCopyWithImpl<$Res, _$SipReportUserResponseImpl>
    implements _$$SipReportUserResponseImplCopyWith<$Res> {
  __$$SipReportUserResponseImplCopyWithImpl(
    _$SipReportUserResponseImpl _value,
    $Res Function(_$SipReportUserResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SipReportUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? email = null,
  }) {
    return _then(
      _$SipReportUserResponseImpl(
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
class _$SipReportUserResponseImpl implements _SipReportUserResponse {
  const _$SipReportUserResponseImpl({
    @JsonKey(name: "id") required this.id,
    @JsonKey(name: "fullName") required this.fullName,
    @JsonKey(name: "email") required this.email,
  });

  factory _$SipReportUserResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SipReportUserResponseImplFromJson(json);

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
    return 'SipReportUserResponse(id: $id, fullName: $fullName, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SipReportUserResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, fullName, email);

  /// Create a copy of SipReportUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SipReportUserResponseImplCopyWith<_$SipReportUserResponseImpl>
  get copyWith =>
      __$$SipReportUserResponseImplCopyWithImpl<_$SipReportUserResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SipReportUserResponseImplToJson(this);
  }
}

abstract class _SipReportUserResponse implements SipReportUserResponse {
  const factory _SipReportUserResponse({
    @JsonKey(name: "id") required final int id,
    @JsonKey(name: "fullName") required final String fullName,
    @JsonKey(name: "email") required final String email,
  }) = _$SipReportUserResponseImpl;

  factory _SipReportUserResponse.fromJson(Map<String, dynamic> json) =
      _$SipReportUserResponseImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "fullName")
  String get fullName;
  @override
  @JsonKey(name: "email")
  String get email;

  /// Create a copy of SipReportUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SipReportUserResponseImplCopyWith<_$SipReportUserResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

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
  @JsonKey(name: "user")
  SipReportUserResponse get user => throw _privateConstructorUsedError;

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
    @JsonKey(name: "user") SipReportUserResponse user,
  });

  $SipReportUserResponseCopyWith<$Res> get user;
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
    Object? user = null,
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
            user: null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as SipReportUserResponse,
          )
          as $Val,
    );
  }

  /// Create a copy of SipReportResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SipReportUserResponseCopyWith<$Res> get user {
    return $SipReportUserResponseCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
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
    @JsonKey(name: "user") SipReportUserResponse user,
  });

  @override
  $SipReportUserResponseCopyWith<$Res> get user;
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
    Object? user = null,
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
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as SipReportUserResponse,
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
    @JsonKey(name: "user") required this.user,
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
  @JsonKey(name: "user")
  final SipReportUserResponse user;

  @override
  String toString() {
    return 'SipReportResponse(id: $id, title: $title, description: $description, image: $image, link: $link, approved: $approved, uid: $uid, user: $user)';
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
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.user, user) || other.user == user));
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
    user,
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
    @JsonKey(name: "user") required final SipReportUserResponse user,
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
  @override
  @JsonKey(name: "user")
  SipReportUserResponse get user;

  /// Create a copy of SipReportResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SipReportResponseImplCopyWith<_$SipReportResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
