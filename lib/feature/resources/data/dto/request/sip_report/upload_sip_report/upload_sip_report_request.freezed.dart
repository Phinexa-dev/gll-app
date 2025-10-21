// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_sip_report_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UploadSipReportRequest _$UploadSipReportRequestFromJson(
  Map<String, dynamic> json,
) {
  return _UploadSipReportRequest.fromJson(json);
}

/// @nodoc
mixin _$UploadSipReportRequest {
  @JsonKey(name: "title")
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "image")
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: "link")
  String? get link => throw _privateConstructorUsedError;

  /// Serializes this UploadSipReportRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadSipReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadSipReportRequestCopyWith<UploadSipReportRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadSipReportRequestCopyWith<$Res> {
  factory $UploadSipReportRequestCopyWith(
    UploadSipReportRequest value,
    $Res Function(UploadSipReportRequest) then,
  ) = _$UploadSipReportRequestCopyWithImpl<$Res, UploadSipReportRequest>;
  @useResult
  $Res call({
    @JsonKey(name: "title") String title,
    @JsonKey(name: "description") String description,
    @JsonKey(name: "image") String image,
    @JsonKey(name: "link") String? link,
  });
}

/// @nodoc
class _$UploadSipReportRequestCopyWithImpl<
  $Res,
  $Val extends UploadSipReportRequest
>
    implements $UploadSipReportRequestCopyWith<$Res> {
  _$UploadSipReportRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadSipReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? image = null,
    Object? link = freezed,
  }) {
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UploadSipReportRequestImplCopyWith<$Res>
    implements $UploadSipReportRequestCopyWith<$Res> {
  factory _$$UploadSipReportRequestImplCopyWith(
    _$UploadSipReportRequestImpl value,
    $Res Function(_$UploadSipReportRequestImpl) then,
  ) = __$$UploadSipReportRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "title") String title,
    @JsonKey(name: "description") String description,
    @JsonKey(name: "image") String image,
    @JsonKey(name: "link") String? link,
  });
}

/// @nodoc
class __$$UploadSipReportRequestImplCopyWithImpl<$Res>
    extends
        _$UploadSipReportRequestCopyWithImpl<$Res, _$UploadSipReportRequestImpl>
    implements _$$UploadSipReportRequestImplCopyWith<$Res> {
  __$$UploadSipReportRequestImplCopyWithImpl(
    _$UploadSipReportRequestImpl _value,
    $Res Function(_$UploadSipReportRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UploadSipReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? image = null,
    Object? link = freezed,
  }) {
    return _then(
      _$UploadSipReportRequestImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadSipReportRequestImpl implements _UploadSipReportRequest {
  const _$UploadSipReportRequestImpl({
    @JsonKey(name: "title") required this.title,
    @JsonKey(name: "description") required this.description,
    @JsonKey(name: "image") required this.image,
    @JsonKey(name: "link") this.link,
  });

  factory _$UploadSipReportRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadSipReportRequestImplFromJson(json);

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
  String toString() {
    return 'UploadSipReportRequest(title: $title, description: $description, image: $image, link: $link)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadSipReportRequestImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.link, link) || other.link == link));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, image, link);

  /// Create a copy of UploadSipReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadSipReportRequestImplCopyWith<_$UploadSipReportRequestImpl>
  get copyWith =>
      __$$UploadSipReportRequestImplCopyWithImpl<_$UploadSipReportRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadSipReportRequestImplToJson(this);
  }
}

abstract class _UploadSipReportRequest implements UploadSipReportRequest {
  const factory _UploadSipReportRequest({
    @JsonKey(name: "title") required final String title,
    @JsonKey(name: "description") required final String description,
    @JsonKey(name: "image") required final String image,
    @JsonKey(name: "link") final String? link,
  }) = _$UploadSipReportRequestImpl;

  factory _UploadSipReportRequest.fromJson(Map<String, dynamic> json) =
      _$UploadSipReportRequestImpl.fromJson;

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

  /// Create a copy of UploadSipReportRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadSipReportRequestImplCopyWith<_$UploadSipReportRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
