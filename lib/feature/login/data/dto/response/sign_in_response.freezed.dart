// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SignInResponse _$SignInResponseFromJson(Map<String, dynamic> json) {
  return _SignInResponse.fromJson(json);
}

/// @nodoc
mixin _$SignInResponse {
  @JsonKey(name: "access_token")
  String get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: "user")
  User get user => throw _privateConstructorUsedError;

  /// Serializes this SignInResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignInResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignInResponseCopyWith<SignInResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInResponseCopyWith<$Res> {
  factory $SignInResponseCopyWith(
    SignInResponse value,
    $Res Function(SignInResponse) then,
  ) = _$SignInResponseCopyWithImpl<$Res, SignInResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "access_token") String accessToken,
    @JsonKey(name: "user") User user,
  });

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$SignInResponseCopyWithImpl<$Res, $Val extends SignInResponse>
    implements $SignInResponseCopyWith<$Res> {
  _$SignInResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignInResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? accessToken = null, Object? user = null}) {
    return _then(
      _value.copyWith(
            accessToken: null == accessToken
                ? _value.accessToken
                : accessToken // ignore: cast_nullable_to_non_nullable
                      as String,
            user: null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as User,
          )
          as $Val,
    );
  }

  /// Create a copy of SignInResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SignInResponseImplCopyWith<$Res>
    implements $SignInResponseCopyWith<$Res> {
  factory _$$SignInResponseImplCopyWith(
    _$SignInResponseImpl value,
    $Res Function(_$SignInResponseImpl) then,
  ) = __$$SignInResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "access_token") String accessToken,
    @JsonKey(name: "user") User user,
  });

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$SignInResponseImplCopyWithImpl<$Res>
    extends _$SignInResponseCopyWithImpl<$Res, _$SignInResponseImpl>
    implements _$$SignInResponseImplCopyWith<$Res> {
  __$$SignInResponseImplCopyWithImpl(
    _$SignInResponseImpl _value,
    $Res Function(_$SignInResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SignInResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? accessToken = null, Object? user = null}) {
    return _then(
      _$SignInResponseImpl(
        accessToken: null == accessToken
            ? _value.accessToken
            : accessToken // ignore: cast_nullable_to_non_nullable
                  as String,
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as User,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SignInResponseImpl implements _SignInResponse {
  const _$SignInResponseImpl({
    @JsonKey(name: "access_token") required this.accessToken,
    @JsonKey(name: "user") required this.user,
  });

  factory _$SignInResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignInResponseImplFromJson(json);

  @override
  @JsonKey(name: "access_token")
  final String accessToken;
  @override
  @JsonKey(name: "user")
  final User user;

  @override
  String toString() {
    return 'SignInResponse(accessToken: $accessToken, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInResponseImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, user);

  /// Create a copy of SignInResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInResponseImplCopyWith<_$SignInResponseImpl> get copyWith =>
      __$$SignInResponseImplCopyWithImpl<_$SignInResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SignInResponseImplToJson(this);
  }
}

abstract class _SignInResponse implements SignInResponse {
  const factory _SignInResponse({
    @JsonKey(name: "access_token") required final String accessToken,
    @JsonKey(name: "user") required final User user,
  }) = _$SignInResponseImpl;

  factory _SignInResponse.fromJson(Map<String, dynamic> json) =
      _$SignInResponseImpl.fromJson;

  @override
  @JsonKey(name: "access_token")
  String get accessToken;
  @override
  @JsonKey(name: "user")
  User get user;

  /// Create a copy of SignInResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInResponseImplCopyWith<_$SignInResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "fullName")
  String get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: "dialCode")
  String get dialCode => throw _privateConstructorUsedError;
  @JsonKey(name: "mobileNumber")
  String get mobileNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "country")
  dynamic get country => throw _privateConstructorUsedError;
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
  @JsonKey(name: "userIntrests")
  dynamic get userIntrests => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call({
    @JsonKey(name: "id") int id,
    @JsonKey(name: "fullName") String fullName,
    @JsonKey(name: "email") String email,
    @JsonKey(name: "dialCode") String dialCode,
    @JsonKey(name: "mobileNumber") String mobileNumber,
    @JsonKey(name: "country") dynamic country,
    @JsonKey(name: "faceBook") dynamic faceBook,
    @JsonKey(name: "blog") dynamic blog,
    @JsonKey(name: "twitter") dynamic twitter,
    @JsonKey(name: "x") dynamic x,
    @JsonKey(name: "instagram") dynamic instagram,
    @JsonKey(name: "userIntrests") dynamic userIntrests,
  });
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? email = null,
    Object? dialCode = null,
    Object? mobileNumber = null,
    Object? country = freezed,
    Object? faceBook = freezed,
    Object? blog = freezed,
    Object? twitter = freezed,
    Object? x = freezed,
    Object? instagram = freezed,
    Object? userIntrests = freezed,
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
            dialCode: null == dialCode
                ? _value.dialCode
                : dialCode // ignore: cast_nullable_to_non_nullable
                      as String,
            mobileNumber: null == mobileNumber
                ? _value.mobileNumber
                : mobileNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            country: freezed == country
                ? _value.country
                : country // ignore: cast_nullable_to_non_nullable
                      as dynamic,
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
            userIntrests: freezed == userIntrests
                ? _value.userIntrests
                : userIntrests // ignore: cast_nullable_to_non_nullable
                      as dynamic,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
    _$UserImpl value,
    $Res Function(_$UserImpl) then,
  ) = __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "id") int id,
    @JsonKey(name: "fullName") String fullName,
    @JsonKey(name: "email") String email,
    @JsonKey(name: "dialCode") String dialCode,
    @JsonKey(name: "mobileNumber") String mobileNumber,
    @JsonKey(name: "country") dynamic country,
    @JsonKey(name: "faceBook") dynamic faceBook,
    @JsonKey(name: "blog") dynamic blog,
    @JsonKey(name: "twitter") dynamic twitter,
    @JsonKey(name: "x") dynamic x,
    @JsonKey(name: "instagram") dynamic instagram,
    @JsonKey(name: "userIntrests") dynamic userIntrests,
  });
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
    : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? email = null,
    Object? dialCode = null,
    Object? mobileNumber = null,
    Object? country = freezed,
    Object? faceBook = freezed,
    Object? blog = freezed,
    Object? twitter = freezed,
    Object? x = freezed,
    Object? instagram = freezed,
    Object? userIntrests = freezed,
  }) {
    return _then(
      _$UserImpl(
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
        dialCode: null == dialCode
            ? _value.dialCode
            : dialCode // ignore: cast_nullable_to_non_nullable
                  as String,
        mobileNumber: null == mobileNumber
            ? _value.mobileNumber
            : mobileNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        country: freezed == country
            ? _value.country
            : country // ignore: cast_nullable_to_non_nullable
                  as dynamic,
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
        userIntrests: freezed == userIntrests
            ? _value.userIntrests
            : userIntrests // ignore: cast_nullable_to_non_nullable
                  as dynamic,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl({
    @JsonKey(name: "id") required this.id,
    @JsonKey(name: "fullName") required this.fullName,
    @JsonKey(name: "email") required this.email,
    @JsonKey(name: "dialCode") required this.dialCode,
    @JsonKey(name: "mobileNumber") required this.mobileNumber,
    @JsonKey(name: "country") required this.country,
    @JsonKey(name: "faceBook") required this.faceBook,
    @JsonKey(name: "blog") required this.blog,
    @JsonKey(name: "twitter") required this.twitter,
    @JsonKey(name: "x") required this.x,
    @JsonKey(name: "instagram") required this.instagram,
    @JsonKey(name: "userIntrests") required this.userIntrests,
  });

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

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
  @JsonKey(name: "dialCode")
  final String dialCode;
  @override
  @JsonKey(name: "mobileNumber")
  final String mobileNumber;
  @override
  @JsonKey(name: "country")
  final dynamic country;
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
  @JsonKey(name: "userIntrests")
  final dynamic userIntrests;

  @override
  String toString() {
    return 'User(id: $id, fullName: $fullName, email: $email, dialCode: $dialCode, mobileNumber: $mobileNumber, country: $country, faceBook: $faceBook, blog: $blog, twitter: $twitter, x: $x, instagram: $instagram, userIntrests: $userIntrests)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.dialCode, dialCode) ||
                other.dialCode == dialCode) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            const DeepCollectionEquality().equals(other.country, country) &&
            const DeepCollectionEquality().equals(other.faceBook, faceBook) &&
            const DeepCollectionEquality().equals(other.blog, blog) &&
            const DeepCollectionEquality().equals(other.twitter, twitter) &&
            const DeepCollectionEquality().equals(other.x, x) &&
            const DeepCollectionEquality().equals(other.instagram, instagram) &&
            const DeepCollectionEquality().equals(
              other.userIntrests,
              userIntrests,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    fullName,
    email,
    dialCode,
    mobileNumber,
    const DeepCollectionEquality().hash(country),
    const DeepCollectionEquality().hash(faceBook),
    const DeepCollectionEquality().hash(blog),
    const DeepCollectionEquality().hash(twitter),
    const DeepCollectionEquality().hash(x),
    const DeepCollectionEquality().hash(instagram),
    const DeepCollectionEquality().hash(userIntrests),
  );

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(this);
  }
}

abstract class _User implements User {
  const factory _User({
    @JsonKey(name: "id") required final int id,
    @JsonKey(name: "fullName") required final String fullName,
    @JsonKey(name: "email") required final String email,
    @JsonKey(name: "dialCode") required final String dialCode,
    @JsonKey(name: "mobileNumber") required final String mobileNumber,
    @JsonKey(name: "country") required final dynamic country,
    @JsonKey(name: "faceBook") required final dynamic faceBook,
    @JsonKey(name: "blog") required final dynamic blog,
    @JsonKey(name: "twitter") required final dynamic twitter,
    @JsonKey(name: "x") required final dynamic x,
    @JsonKey(name: "instagram") required final dynamic instagram,
    @JsonKey(name: "userIntrests") required final dynamic userIntrests,
  }) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "fullName")
  String get fullName;
  @override
  @JsonKey(name: "email")
  String get email;
  @override
  @JsonKey(name: "dialCode")
  String get dialCode;
  @override
  @JsonKey(name: "mobileNumber")
  String get mobileNumber;
  @override
  @JsonKey(name: "country")
  dynamic get country;
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
  @override
  @JsonKey(name: "userIntrests")
  dynamic get userIntrests;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
