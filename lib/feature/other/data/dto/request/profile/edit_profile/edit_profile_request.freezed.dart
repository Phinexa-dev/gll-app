// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EditProfileRequest _$EditProfileRequestFromJson(Map<String, dynamic> json) {
  return _EditProfileRequest.fromJson(json);
}

/// @nodoc
mixin _$EditProfileRequest {
  @JsonKey(name: "fullName")
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: "dialCode")
  String? get dialCode => throw _privateConstructorUsedError;
  @JsonKey(name: "mobileNumber")
  String? get mobileNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "userLanguages")
  String? get userLanguages => throw _privateConstructorUsedError;
  @JsonKey(name: "country")
  String? get country => throw _privateConstructorUsedError;
  @JsonKey(name: "userIntrests")
  String? get userIntrests => throw _privateConstructorUsedError;

  /// Serializes this EditProfileRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EditProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EditProfileRequestCopyWith<EditProfileRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileRequestCopyWith<$Res> {
  factory $EditProfileRequestCopyWith(
          EditProfileRequest value, $Res Function(EditProfileRequest) then) =
      _$EditProfileRequestCopyWithImpl<$Res, EditProfileRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "fullName") String? fullName,
      @JsonKey(name: "dialCode") String? dialCode,
      @JsonKey(name: "mobileNumber") String? mobileNumber,
      @JsonKey(name: "userLanguages") String? userLanguages,
      @JsonKey(name: "country") String? country,
      @JsonKey(name: "userIntrests") String? userIntrests});
}

/// @nodoc
class _$EditProfileRequestCopyWithImpl<$Res, $Val extends EditProfileRequest>
    implements $EditProfileRequestCopyWith<$Res> {
  _$EditProfileRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = freezed,
    Object? dialCode = freezed,
    Object? mobileNumber = freezed,
    Object? userLanguages = freezed,
    Object? country = freezed,
    Object? userIntrests = freezed,
  }) {
    return _then(_value.copyWith(
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      dialCode: freezed == dialCode
          ? _value.dialCode
          : dialCode // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      userLanguages: freezed == userLanguages
          ? _value.userLanguages
          : userLanguages // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      userIntrests: freezed == userIntrests
          ? _value.userIntrests
          : userIntrests // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditProfileRequestImplCopyWith<$Res>
    implements $EditProfileRequestCopyWith<$Res> {
  factory _$$EditProfileRequestImplCopyWith(_$EditProfileRequestImpl value,
          $Res Function(_$EditProfileRequestImpl) then) =
      __$$EditProfileRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "fullName") String? fullName,
      @JsonKey(name: "dialCode") String? dialCode,
      @JsonKey(name: "mobileNumber") String? mobileNumber,
      @JsonKey(name: "userLanguages") String? userLanguages,
      @JsonKey(name: "country") String? country,
      @JsonKey(name: "userIntrests") String? userIntrests});
}

/// @nodoc
class __$$EditProfileRequestImplCopyWithImpl<$Res>
    extends _$EditProfileRequestCopyWithImpl<$Res, _$EditProfileRequestImpl>
    implements _$$EditProfileRequestImplCopyWith<$Res> {
  __$$EditProfileRequestImplCopyWithImpl(_$EditProfileRequestImpl _value,
      $Res Function(_$EditProfileRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = freezed,
    Object? dialCode = freezed,
    Object? mobileNumber = freezed,
    Object? userLanguages = freezed,
    Object? country = freezed,
    Object? userIntrests = freezed,
  }) {
    return _then(_$EditProfileRequestImpl(
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      dialCode: freezed == dialCode
          ? _value.dialCode
          : dialCode // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      userLanguages: freezed == userLanguages
          ? _value.userLanguages
          : userLanguages // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      userIntrests: freezed == userIntrests
          ? _value.userIntrests
          : userIntrests // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EditProfileRequestImpl implements _EditProfileRequest {
  const _$EditProfileRequestImpl(
      {@JsonKey(name: "fullName") this.fullName,
      @JsonKey(name: "dialCode") this.dialCode,
      @JsonKey(name: "mobileNumber") this.mobileNumber,
      @JsonKey(name: "userLanguages") this.userLanguages,
      @JsonKey(name: "country") this.country,
      @JsonKey(name: "userIntrests") this.userIntrests});

  factory _$EditProfileRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$EditProfileRequestImplFromJson(json);

  @override
  @JsonKey(name: "fullName")
  final String? fullName;
  @override
  @JsonKey(name: "dialCode")
  final String? dialCode;
  @override
  @JsonKey(name: "mobileNumber")
  final String? mobileNumber;
  @override
  @JsonKey(name: "userLanguages")
  final String? userLanguages;
  @override
  @JsonKey(name: "country")
  final String? country;
  @override
  @JsonKey(name: "userIntrests")
  final String? userIntrests;

  @override
  String toString() {
    return 'EditProfileRequest(fullName: $fullName, dialCode: $dialCode, mobileNumber: $mobileNumber, userLanguages: $userLanguages, country: $country, userIntrests: $userIntrests)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditProfileRequestImpl &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.dialCode, dialCode) ||
                other.dialCode == dialCode) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.userLanguages, userLanguages) ||
                other.userLanguages == userLanguages) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.userIntrests, userIntrests) ||
                other.userIntrests == userIntrests));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fullName, dialCode, mobileNumber,
      userLanguages, country, userIntrests);

  /// Create a copy of EditProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditProfileRequestImplCopyWith<_$EditProfileRequestImpl> get copyWith =>
      __$$EditProfileRequestImplCopyWithImpl<_$EditProfileRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EditProfileRequestImplToJson(
      this,
    );
  }
}

abstract class _EditProfileRequest implements EditProfileRequest {
  const factory _EditProfileRequest(
          {@JsonKey(name: "fullName") final String? fullName,
          @JsonKey(name: "dialCode") final String? dialCode,
          @JsonKey(name: "mobileNumber") final String? mobileNumber,
          @JsonKey(name: "userLanguages") final String? userLanguages,
          @JsonKey(name: "country") final String? country,
          @JsonKey(name: "userIntrests") final String? userIntrests}) =
      _$EditProfileRequestImpl;

  factory _EditProfileRequest.fromJson(Map<String, dynamic> json) =
      _$EditProfileRequestImpl.fromJson;

  @override
  @JsonKey(name: "fullName")
  String? get fullName;
  @override
  @JsonKey(name: "dialCode")
  String? get dialCode;
  @override
  @JsonKey(name: "mobileNumber")
  String? get mobileNumber;
  @override
  @JsonKey(name: "userLanguages")
  String? get userLanguages;
  @override
  @JsonKey(name: "country")
  String? get country;
  @override
  @JsonKey(name: "userIntrests")
  String? get userIntrests;

  /// Create a copy of EditProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditProfileRequestImplCopyWith<_$EditProfileRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
