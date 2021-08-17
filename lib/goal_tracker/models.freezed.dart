// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Goal _$GoalFromJson(Map<String, dynamic> json) {
  return _Goal.fromJson(json);
}

/// @nodoc
class _$GoalTearOff {
  const _$GoalTearOff();

  _Goal call(
      {required String name,
      required String description,
      required String category,
      required String categoryColor,
      String date = '',
      required List<Target> targets}) {
    return _Goal(
      name: name,
      description: description,
      category: category,
      categoryColor: categoryColor,
      date: date,
      targets: targets,
    );
  }

  Goal fromJson(Map<String, Object> json) {
    return Goal.fromJson(json);
  }
}

/// @nodoc
const $Goal = _$GoalTearOff();

/// @nodoc
mixin _$Goal {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get categoryColor =>
      throw _privateConstructorUsedError; // DateTime? date,
  String get date => throw _privateConstructorUsedError;
  List<Target> get targets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GoalCopyWith<Goal> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalCopyWith<$Res> {
  factory $GoalCopyWith(Goal value, $Res Function(Goal) then) =
      _$GoalCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String description,
      String category,
      String categoryColor,
      String date,
      List<Target> targets});
}

/// @nodoc
class _$GoalCopyWithImpl<$Res> implements $GoalCopyWith<$Res> {
  _$GoalCopyWithImpl(this._value, this._then);

  final Goal _value;
  // ignore: unused_field
  final $Res Function(Goal) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? category = freezed,
    Object? categoryColor = freezed,
    Object? date = freezed,
    Object? targets = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      categoryColor: categoryColor == freezed
          ? _value.categoryColor
          : categoryColor // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      targets: targets == freezed
          ? _value.targets
          : targets // ignore: cast_nullable_to_non_nullable
              as List<Target>,
    ));
  }
}

/// @nodoc
abstract class _$GoalCopyWith<$Res> implements $GoalCopyWith<$Res> {
  factory _$GoalCopyWith(_Goal value, $Res Function(_Goal) then) =
      __$GoalCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String description,
      String category,
      String categoryColor,
      String date,
      List<Target> targets});
}

/// @nodoc
class __$GoalCopyWithImpl<$Res> extends _$GoalCopyWithImpl<$Res>
    implements _$GoalCopyWith<$Res> {
  __$GoalCopyWithImpl(_Goal _value, $Res Function(_Goal) _then)
      : super(_value, (v) => _then(v as _Goal));

  @override
  _Goal get _value => super._value as _Goal;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? category = freezed,
    Object? categoryColor = freezed,
    Object? date = freezed,
    Object? targets = freezed,
  }) {
    return _then(_Goal(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      categoryColor: categoryColor == freezed
          ? _value.categoryColor
          : categoryColor // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      targets: targets == freezed
          ? _value.targets
          : targets // ignore: cast_nullable_to_non_nullable
              as List<Target>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Goal extends _Goal {
  _$_Goal(
      {required this.name,
      required this.description,
      required this.category,
      required this.categoryColor,
      this.date = '',
      required this.targets})
      : super._();

  factory _$_Goal.fromJson(Map<String, dynamic> json) =>
      _$_$_GoalFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  final String category;
  @override
  final String categoryColor;
  @JsonKey(defaultValue: '')
  @override // DateTime? date,
  final String date;
  @override
  final List<Target> targets;

  @override
  String toString() {
    return 'Goal(name: $name, description: $description, category: $category, categoryColor: $categoryColor, date: $date, targets: $targets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Goal &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.categoryColor, categoryColor) ||
                const DeepCollectionEquality()
                    .equals(other.categoryColor, categoryColor)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.targets, targets) ||
                const DeepCollectionEquality().equals(other.targets, targets)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(categoryColor) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(targets);

  @JsonKey(ignore: true)
  @override
  _$GoalCopyWith<_Goal> get copyWith =>
      __$GoalCopyWithImpl<_Goal>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GoalToJson(this);
  }
}

abstract class _Goal extends Goal {
  factory _Goal(
      {required String name,
      required String description,
      required String category,
      required String categoryColor,
      String date,
      required List<Target> targets}) = _$_Goal;
  _Goal._() : super._();

  factory _Goal.fromJson(Map<String, dynamic> json) = _$_Goal.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String get category => throw _privateConstructorUsedError;
  @override
  String get categoryColor => throw _privateConstructorUsedError;
  @override // DateTime? date,
  String get date => throw _privateConstructorUsedError;
  @override
  List<Target> get targets => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GoalCopyWith<_Goal> get copyWith => throw _privateConstructorUsedError;
}

Target _$TargetFromJson(Map<String, dynamic> json) {
  return _Target.fromJson(json);
}

/// @nodoc
class _$TargetTearOff {
  const _$TargetTearOff();

  _Target call(
      {required String name,
      String description = '',
      String status = '',
      String date = '',
      int checks = 0,
      int total = 0,
      required List<Task> tasks}) {
    return _Target(
      name: name,
      description: description,
      status: status,
      date: date,
      checks: checks,
      total: total,
      tasks: tasks,
    );
  }

  Target fromJson(Map<String, Object> json) {
    return Target.fromJson(json);
  }
}

/// @nodoc
const $Target = _$TargetTearOff();

/// @nodoc
mixin _$Target {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // TODO: DateTime? date,
  String get date => throw _privateConstructorUsedError;
  int get checks => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  List<Task> get tasks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TargetCopyWith<Target> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TargetCopyWith<$Res> {
  factory $TargetCopyWith(Target value, $Res Function(Target) then) =
      _$TargetCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String description,
      String status,
      String date,
      int checks,
      int total,
      List<Task> tasks});
}

/// @nodoc
class _$TargetCopyWithImpl<$Res> implements $TargetCopyWith<$Res> {
  _$TargetCopyWithImpl(this._value, this._then);

  final Target _value;
  // ignore: unused_field
  final $Res Function(Target) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? status = freezed,
    Object? date = freezed,
    Object? checks = freezed,
    Object? total = freezed,
    Object? tasks = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      checks: checks == freezed
          ? _value.checks
          : checks // ignore: cast_nullable_to_non_nullable
              as int,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      tasks: tasks == freezed
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ));
  }
}

/// @nodoc
abstract class _$TargetCopyWith<$Res> implements $TargetCopyWith<$Res> {
  factory _$TargetCopyWith(_Target value, $Res Function(_Target) then) =
      __$TargetCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String description,
      String status,
      String date,
      int checks,
      int total,
      List<Task> tasks});
}

/// @nodoc
class __$TargetCopyWithImpl<$Res> extends _$TargetCopyWithImpl<$Res>
    implements _$TargetCopyWith<$Res> {
  __$TargetCopyWithImpl(_Target _value, $Res Function(_Target) _then)
      : super(_value, (v) => _then(v as _Target));

  @override
  _Target get _value => super._value as _Target;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? status = freezed,
    Object? date = freezed,
    Object? checks = freezed,
    Object? total = freezed,
    Object? tasks = freezed,
  }) {
    return _then(_Target(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      checks: checks == freezed
          ? _value.checks
          : checks // ignore: cast_nullable_to_non_nullable
              as int,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      tasks: tasks == freezed
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Target extends _Target {
  _$_Target(
      {required this.name,
      this.description = '',
      this.status = '',
      this.date = '',
      this.checks = 0,
      this.total = 0,
      required this.tasks})
      : super._();

  factory _$_Target.fromJson(Map<String, dynamic> json) =>
      _$_$_TargetFromJson(json);

  @override
  final String name;
  @JsonKey(defaultValue: '')
  @override
  final String description;
  @JsonKey(defaultValue: '')
  @override
  final String status;
  @JsonKey(defaultValue: '')
  @override // TODO: DateTime? date,
  final String date;
  @JsonKey(defaultValue: 0)
  @override
  final int checks;
  @JsonKey(defaultValue: 0)
  @override
  final int total;
  @override
  final List<Task> tasks;

  @override
  String toString() {
    return 'Target(name: $name, description: $description, status: $status, date: $date, checks: $checks, total: $total, tasks: $tasks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Target &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.checks, checks) ||
                const DeepCollectionEquality().equals(other.checks, checks)) &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)) &&
            (identical(other.tasks, tasks) ||
                const DeepCollectionEquality().equals(other.tasks, tasks)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(checks) ^
      const DeepCollectionEquality().hash(total) ^
      const DeepCollectionEquality().hash(tasks);

  @JsonKey(ignore: true)
  @override
  _$TargetCopyWith<_Target> get copyWith =>
      __$TargetCopyWithImpl<_Target>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TargetToJson(this);
  }
}

abstract class _Target extends Target {
  factory _Target(
      {required String name,
      String description,
      String status,
      String date,
      int checks,
      int total,
      required List<Task> tasks}) = _$_Target;
  _Target._() : super._();

  factory _Target.fromJson(Map<String, dynamic> json) = _$_Target.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String get status => throw _privateConstructorUsedError;
  @override // TODO: DateTime? date,
  String get date => throw _privateConstructorUsedError;
  @override
  int get checks => throw _privateConstructorUsedError;
  @override
  int get total => throw _privateConstructorUsedError;
  @override
  List<Task> get tasks => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TargetCopyWith<_Target> get copyWith => throw _privateConstructorUsedError;
}

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
class _$TaskTearOff {
  const _$TaskTearOff();

  _Task call({required int checks, required int total}) {
    return _Task(
      checks: checks,
      total: total,
    );
  }

  Task fromJson(Map<String, Object> json) {
    return Task.fromJson(json);
  }
}

/// @nodoc
const $Task = _$TaskTearOff();

/// @nodoc
mixin _$Task {
  int get checks => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res>;
  $Res call({int checks, int total});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res> implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  final Task _value;
  // ignore: unused_field
  final $Res Function(Task) _then;

  @override
  $Res call({
    Object? checks = freezed,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      checks: checks == freezed
          ? _value.checks
          : checks // ignore: cast_nullable_to_non_nullable
              as int,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$TaskCopyWith(_Task value, $Res Function(_Task) then) =
      __$TaskCopyWithImpl<$Res>;
  @override
  $Res call({int checks, int total});
}

/// @nodoc
class __$TaskCopyWithImpl<$Res> extends _$TaskCopyWithImpl<$Res>
    implements _$TaskCopyWith<$Res> {
  __$TaskCopyWithImpl(_Task _value, $Res Function(_Task) _then)
      : super(_value, (v) => _then(v as _Task));

  @override
  _Task get _value => super._value as _Task;

  @override
  $Res call({
    Object? checks = freezed,
    Object? total = freezed,
  }) {
    return _then(_Task(
      checks: checks == freezed
          ? _value.checks
          : checks // ignore: cast_nullable_to_non_nullable
              as int,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Task extends _Task {
  _$_Task({required this.checks, required this.total}) : super._();

  factory _$_Task.fromJson(Map<String, dynamic> json) =>
      _$_$_TaskFromJson(json);

  @override
  final int checks;
  @override
  final int total;

  @override
  String toString() {
    return 'Task(checks: $checks, total: $total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Task &&
            (identical(other.checks, checks) ||
                const DeepCollectionEquality().equals(other.checks, checks)) &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(checks) ^
      const DeepCollectionEquality().hash(total);

  @JsonKey(ignore: true)
  @override
  _$TaskCopyWith<_Task> get copyWith =>
      __$TaskCopyWithImpl<_Task>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TaskToJson(this);
  }
}

abstract class _Task extends Task {
  factory _Task({required int checks, required int total}) = _$_Task;
  _Task._() : super._();

  factory _Task.fromJson(Map<String, dynamic> json) = _$_Task.fromJson;

  @override
  int get checks => throw _privateConstructorUsedError;
  @override
  int get total => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TaskCopyWith<_Task> get copyWith => throw _privateConstructorUsedError;
}
