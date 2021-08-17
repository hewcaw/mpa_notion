// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimeCategory _$TimeCategoryFromJson(Map<String, dynamic> json) {
  return _TimeCategory.fromJson(json);
}

/// @nodoc
class _$TimeCategoryTearOff {
  const _$TimeCategoryTearOff();

  _TimeCategory call(
      {required String name,
      @JsonKey(name: 'children') required List<DateDuration> durations}) {
    return _TimeCategory(
      name: name,
      durations: durations,
    );
  }

  TimeCategory fromJson(Map<String, Object> json) {
    return TimeCategory.fromJson(json);
  }
}

/// @nodoc
const $TimeCategory = _$TimeCategoryTearOff();

/// @nodoc
mixin _$TimeCategory {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'children')
  List<DateDuration> get durations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeCategoryCopyWith<TimeCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeCategoryCopyWith<$Res> {
  factory $TimeCategoryCopyWith(
          TimeCategory value, $Res Function(TimeCategory) then) =
      _$TimeCategoryCopyWithImpl<$Res>;
  $Res call(
      {String name, @JsonKey(name: 'children') List<DateDuration> durations});
}

/// @nodoc
class _$TimeCategoryCopyWithImpl<$Res> implements $TimeCategoryCopyWith<$Res> {
  _$TimeCategoryCopyWithImpl(this._value, this._then);

  final TimeCategory _value;
  // ignore: unused_field
  final $Res Function(TimeCategory) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? durations = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      durations: durations == freezed
          ? _value.durations
          : durations // ignore: cast_nullable_to_non_nullable
              as List<DateDuration>,
    ));
  }
}

/// @nodoc
abstract class _$TimeCategoryCopyWith<$Res>
    implements $TimeCategoryCopyWith<$Res> {
  factory _$TimeCategoryCopyWith(
          _TimeCategory value, $Res Function(_TimeCategory) then) =
      __$TimeCategoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name, @JsonKey(name: 'children') List<DateDuration> durations});
}

/// @nodoc
class __$TimeCategoryCopyWithImpl<$Res> extends _$TimeCategoryCopyWithImpl<$Res>
    implements _$TimeCategoryCopyWith<$Res> {
  __$TimeCategoryCopyWithImpl(
      _TimeCategory _value, $Res Function(_TimeCategory) _then)
      : super(_value, (v) => _then(v as _TimeCategory));

  @override
  _TimeCategory get _value => super._value as _TimeCategory;

  @override
  $Res call({
    Object? name = freezed,
    Object? durations = freezed,
  }) {
    return _then(_TimeCategory(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      durations: durations == freezed
          ? _value.durations
          : durations // ignore: cast_nullable_to_non_nullable
              as List<DateDuration>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_TimeCategory extends _TimeCategory {
  _$_TimeCategory(
      {required this.name, @JsonKey(name: 'children') required this.durations})
      : super._();

  factory _$_TimeCategory.fromJson(Map<String, dynamic> json) =>
      _$_$_TimeCategoryFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'children')
  final List<DateDuration> durations;

  @override
  String toString() {
    return 'TimeCategory(name: $name, durations: $durations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TimeCategory &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.durations, durations) ||
                const DeepCollectionEquality()
                    .equals(other.durations, durations)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(durations);

  @JsonKey(ignore: true)
  @override
  _$TimeCategoryCopyWith<_TimeCategory> get copyWith =>
      __$TimeCategoryCopyWithImpl<_TimeCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TimeCategoryToJson(this);
  }
}

abstract class _TimeCategory extends TimeCategory {
  factory _TimeCategory(
          {required String name,
          @JsonKey(name: 'children') required List<DateDuration> durations}) =
      _$_TimeCategory;
  _TimeCategory._() : super._();

  factory _TimeCategory.fromJson(Map<String, dynamic> json) =
      _$_TimeCategory.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'children')
  List<DateDuration> get durations => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TimeCategoryCopyWith<_TimeCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

DateDuration _$DateDurationFromJson(Map<String, dynamic> json) {
  return _DateDuration.fromJson(json);
}

/// @nodoc
class _$DateDurationTearOff {
  const _$DateDurationTearOff();

  _DateDuration call(
      {@JsonKey(name: 'name') required String date, required int duration}) {
    return _DateDuration(
      date: date,
      duration: duration,
    );
  }

  DateDuration fromJson(Map<String, Object> json) {
    return DateDuration.fromJson(json);
  }
}

/// @nodoc
const $DateDuration = _$DateDurationTearOff();

/// @nodoc
mixin _$DateDuration {
  @JsonKey(name: 'name')
  String get date => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DateDurationCopyWith<DateDuration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DateDurationCopyWith<$Res> {
  factory $DateDurationCopyWith(
          DateDuration value, $Res Function(DateDuration) then) =
      _$DateDurationCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'name') String date, int duration});
}

/// @nodoc
class _$DateDurationCopyWithImpl<$Res> implements $DateDurationCopyWith<$Res> {
  _$DateDurationCopyWithImpl(this._value, this._then);

  final DateDuration _value;
  // ignore: unused_field
  final $Res Function(DateDuration) _then;

  @override
  $Res call({
    Object? date = freezed,
    Object? duration = freezed,
  }) {
    return _then(_value.copyWith(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$DateDurationCopyWith<$Res>
    implements $DateDurationCopyWith<$Res> {
  factory _$DateDurationCopyWith(
          _DateDuration value, $Res Function(_DateDuration) then) =
      __$DateDurationCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'name') String date, int duration});
}

/// @nodoc
class __$DateDurationCopyWithImpl<$Res> extends _$DateDurationCopyWithImpl<$Res>
    implements _$DateDurationCopyWith<$Res> {
  __$DateDurationCopyWithImpl(
      _DateDuration _value, $Res Function(_DateDuration) _then)
      : super(_value, (v) => _then(v as _DateDuration));

  @override
  _DateDuration get _value => super._value as _DateDuration;

  @override
  $Res call({
    Object? date = freezed,
    Object? duration = freezed,
  }) {
    return _then(_DateDuration(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_DateDuration extends _DateDuration {
  _$_DateDuration(
      {@JsonKey(name: 'name') required this.date, required this.duration})
      : super._();

  factory _$_DateDuration.fromJson(Map<String, dynamic> json) =>
      _$_$_DateDurationFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String date;
  @override
  final int duration;

  @override
  String toString() {
    return 'DateDuration(date: $date, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DateDuration &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(duration);

  @JsonKey(ignore: true)
  @override
  _$DateDurationCopyWith<_DateDuration> get copyWith =>
      __$DateDurationCopyWithImpl<_DateDuration>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DateDurationToJson(this);
  }
}

abstract class _DateDuration extends DateDuration {
  factory _DateDuration(
      {@JsonKey(name: 'name') required String date,
      required int duration}) = _$_DateDuration;
  _DateDuration._() : super._();

  factory _DateDuration.fromJson(Map<String, dynamic> json) =
      _$_DateDuration.fromJson;

  @override
  @JsonKey(name: 'name')
  String get date => throw _privateConstructorUsedError;
  @override
  int get duration => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DateDurationCopyWith<_DateDuration> get copyWith =>
      throw _privateConstructorUsedError;
}
