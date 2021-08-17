// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TimeCategory _$_$_TimeCategoryFromJson(Map<String, dynamic> json) {
  return _$_TimeCategory(
    name: json['name'] as String,
    durations: (json['children'] as List<dynamic>)
        .map((e) => DateDuration.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_TimeCategoryToJson(_$_TimeCategory instance) =>
    <String, dynamic>{
      'name': instance.name,
      'children': instance.durations.map((e) => e.toJson()).toList(),
    };

_$_DateDuration _$_$_DateDurationFromJson(Map<String, dynamic> json) {
  return _$_DateDuration(
    date: json['name'] as String,
    duration: json['duration'] as int,
  );
}

Map<String, dynamic> _$_$_DateDurationToJson(_$_DateDuration instance) =>
    <String, dynamic>{
      'name': instance.date,
      'duration': instance.duration,
    };
