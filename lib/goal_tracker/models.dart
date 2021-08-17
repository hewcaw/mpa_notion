import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils.dart' show NaNToZero;

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class Goal with _$Goal {
  const Goal._();

  @JsonSerializable(explicitToJson: true)
  factory Goal({
    required String name,
    required String description,
    required String category,
    required String categoryColor,
    // DateTime? date,
    @Default('') String date,
    required List<Target> targets,
  }) = _Goal;

  // I don't like my goal progress to wiggling around just because I added a new to-do
  double get progress {
    int checks = 0;
    int total = 0;
    targets.forEach((target) {
      // checks += target.taskCounts['checks']!;
      checks += target.checks;
      // total += target.taskCounts['total']!;
      total += target.total;
    });
    return checks / total;
  }

  // double get goalPercent =>
  //     targets.fold(0, (sum, next) => sum + next.tasksPercent);

  factory Goal.fromJson(Map<String, dynamic> json) => _$GoalFromJson(json);

  static toList(List<dynamic> goals) => goals.map<Goal>((i) => Goal.fromJson(i)).toList();
}

@freezed
class Target with _$Target {
  const Target._();

  factory Target({
    required String name,
    @Default('') String description,
    @Default('') String status,
    // TODO: DateTime? date,
    @Default('') String date,
    @Default(0) int checks,
    @Default(0) int total,
    required List<Task> tasks,
  }) = _Target;

  Map<String, int> get taskCounts {
    int checks = 0;
    int total = 0;
    tasks.forEach((tasks) {
      checks += tasks.checks;
      total += tasks.total;
    });
    return {
      'checks': checks,
      'total': total,
    };
  }
  // String get tasksCount {
  //   final finishedTask =
  //       tasks.where((task) => (task.isCompleted == true)).toList().length;
  //   return "$finishedTask/${tasks.length}";
  // }

  factory Target.fromJson(Map<String, dynamic> json) => _$TargetFromJson(json);
}

@freezed
class Task with _$Task {
  const Task._();

  factory Task({
    required int checks,
    required int total,
    // required double percent,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
