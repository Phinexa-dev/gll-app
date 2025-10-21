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
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SipReportUser _$SipReportUserFromJson(Map<String, dynamic> json) {
  return _SipReportUser.fromJson(json);
}

/// @nodoc
mixin _$SipReportUser {
  int get id => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  /// Serializes this SipReportUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SipReportUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SipReportUserCopyWith<SipReportUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SipReportUserCopyWith<$Res> {
  factory $SipReportUserCopyWith(
    SipReportUser value,
    $Res Function(SipReportUser) then,
  ) = _$SipReportUserCopyWithImpl<$Res, SipReportUser>;
  @useResult
  $Res call({int id, String fullName, String email});
}

/// @nodoc
class _$SipReportUserCopyWithImpl<$Res, $Val extends SipReportUser>
    implements $SipReportUserCopyWith<$Res> {
  _$SipReportUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SipReportUser
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
abstract class _$$SipReportUserImplCopyWith<$Res>
    implements $SipReportUserCopyWith<$Res> {
  factory _$$SipReportUserImplCopyWith(
    _$SipReportUserImpl value,
    $Res Function(_$SipReportUserImpl) then,
  ) = __$$SipReportUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String fullName, String email});
}

/// @nodoc
class __$$SipReportUserImplCopyWithImpl<$Res>
    extends _$SipReportUserCopyWithImpl<$Res, _$SipReportUserImpl>
    implements _$$SipReportUserImplCopyWith<$Res> {
  __$$SipReportUserImplCopyWithImpl(
    _$SipReportUserImpl _value,
    $Res Function(_$SipReportUserImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SipReportUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? email = null,
  }) {
    return _then(
      _$SipReportUserImpl(
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
class _$SipReportUserImpl implements _SipReportUser {
  const _$SipReportUserImpl({
    required this.id,
    required this.fullName,
    required this.email,
  });

  factory _$SipReportUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$SipReportUserImplFromJson(json);

  @override
  final int id;
  @override
  final String fullName;
  @override
  final String email;

  @override
  String toString() {
    return 'SipReportUser(id: $id, fullName: $fullName, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SipReportUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, fullName, email);

  /// Create a copy of SipReportUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SipReportUserImplCopyWith<_$SipReportUserImpl> get copyWith =>
      __$$SipReportUserImplCopyWithImpl<_$SipReportUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SipReportUserImplToJson(this);
  }
}

abstract class _SipReportUser implements SipReportUser {
  const factory _SipReportUser({
    required final int id,
    required final String fullName,
    required final String email,
  }) = _$SipReportUserImpl;

  factory _SipReportUser.fromJson(Map<String, dynamic> json) =
      _$SipReportUserImpl.fromJson;

  @override
  int get id;
  @override
  String get fullName;
  @override
  String get email;

  /// Create a copy of SipReportUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SipReportUserImplCopyWith<_$SipReportUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SipReportModel _$SipReportModelFromJson(Map<String, dynamic> json) {
  return _SipReportModel.fromJson(json);
}

/// @nodoc
mixin _$SipReportModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String? get link => throw _privateConstructorUsedError;
  int get approved => throw _privateConstructorUsedError;
  int get uid => throw _privateConstructorUsedError;
  SipReportUser get user => throw _privateConstructorUsedError;

  /// Serializes this SipReportModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SipReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SipReportModelCopyWith<SipReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SipReportModelCopyWith<$Res> {
  factory $SipReportModelCopyWith(
    SipReportModel value,
    $Res Function(SipReportModel) then,
  ) = _$SipReportModelCopyWithImpl<$Res, SipReportModel>;
  @useResult
  $Res call({
    int id,
    String title,
    String description,
    String image,
    String? link,
    int approved,
    int uid,
    SipReportUser user,
  });

  $SipReportUserCopyWith<$Res> get user;
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
                      as SipReportUser,
          )
          as $Val,
    );
  }

  /// Create a copy of SipReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SipReportUserCopyWith<$Res> get user {
    return $SipReportUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SipReportModelImplCopyWith<$Res>
    implements $SipReportModelCopyWith<$Res> {
  factory _$$SipReportModelImplCopyWith(
    _$SipReportModelImpl value,
    $Res Function(_$SipReportModelImpl) then,
  ) = __$$SipReportModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String title,
    String description,
    String image,
    String? link,
    int approved,
    int uid,
    SipReportUser user,
  });

  @override
  $SipReportUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$SipReportModelImplCopyWithImpl<$Res>
    extends _$SipReportModelCopyWithImpl<$Res, _$SipReportModelImpl>
    implements _$$SipReportModelImplCopyWith<$Res> {
  __$$SipReportModelImplCopyWithImpl(
    _$SipReportModelImpl _value,
    $Res Function(_$SipReportModelImpl) _then,
  ) : super(_value, _then);

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
    Object? approved = null,
    Object? uid = null,
    Object? user = null,
  }) {
    return _then(
      _$SipReportModelImpl(
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
                  as SipReportUser,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SipReportModelImpl implements _SipReportModel {
  const _$SipReportModelImpl({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    this.link,
    required this.approved,
    required this.uid,
    required this.user,
  });

  factory _$SipReportModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SipReportModelImplFromJson(json);

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
  final int approved;
  @override
  final int uid;
  @override
  final SipReportUser user;

  @override
  String toString() {
    return 'SipReportModel(id: $id, title: $title, description: $description, image: $image, link: $link, approved: $approved, uid: $uid, user: $user)';
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

  /// Create a copy of SipReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SipReportModelImplCopyWith<_$SipReportModelImpl> get copyWith =>
      __$$SipReportModelImplCopyWithImpl<_$SipReportModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SipReportModelImplToJson(this);
  }
}

abstract class _SipReportModel implements SipReportModel {
  const factory _SipReportModel({
    required final int id,
    required final String title,
    required final String description,
    required final String image,
    final String? link,
    required final int approved,
    required final int uid,
    required final SipReportUser user,
  }) = _$SipReportModelImpl;

  factory _SipReportModel.fromJson(Map<String, dynamic> json) =
      _$SipReportModelImpl.fromJson;

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
  @override
  int get approved;
  @override
  int get uid;
  @override
  SipReportUser get user;

  /// Create a copy of SipReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SipReportModelImplCopyWith<_$SipReportModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
