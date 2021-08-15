import 'package:freezed_annotation/freezed_annotation.dart';

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

  double get progress {
    int checks = 0;
    int total = 0;
    targets.forEach((target) {
      checks += target.taskCounts['checks']!;
      total += target.taskCounts['total']!;
    });
    return checks / total;
  }
  //   targets.fold<Map<String, int>>(0, (sum, next) {
  // }
  //       // final int total = targets.fold(0, (sum, next) => sum + next.total);

  //       // return sum + (1 / total) * (next.checks / next.total);
  //     });

  // // double get goalPercent =>
  // //     targets.fold(0, (sum, next) => sum + next.tasksPercent);

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
