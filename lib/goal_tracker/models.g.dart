// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Goal _$_$_GoalFromJson(Map<String, dynamic> json) {
  return _$_Goal(
    name: json['name'] as String,
    description: json['description'] as String,
    category: json['category'] as String,
    categoryColor: json['categoryColor'] as String,
    date: json['date'] as String? ?? '',
    targets: (json['targets'] as List<dynamic>)
        .map((e) => Target.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_GoalToJson(_$_Goal instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'categoryColor': instance.categoryColor,
      'date': instance.date,
      'targets': instance.targets.map((e) => e.toJson()).toList(),
    };

_$_Target _$_$_TargetFromJson(Map<String, dynamic> json) {
  return _$_Target(
    name: json['name'] as String,
    description: json['description'] as String? ?? '',
    status: json['status'] as String? ?? '',
    date: json['date'] as String? ?? '',
    checks: json['checks'] as int? ?? 0,
    total: json['total'] as int? ?? 0,
    tasks: (json['tasks'] as List<dynamic>)
        .map((e) => Task.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_TargetToJson(_$_Target instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'status': instance.status,
      'date': instance.date,
      'checks': instance.checks,
      'total': instance.total,
      'tasks': instance.tasks,
    };

_$_Task _$_$_TaskFromJson(Map<String, dynamic> json) {
  return _$_Task(
    checks: json['checks'] as int,
    total: json['total'] as int,
  );
}

Map<String, dynamic> _$_$_TaskToJson(_$_Task instance) => <String, dynamic>{
      'checks': instance.checks,
      'total': instance.total,
    };
