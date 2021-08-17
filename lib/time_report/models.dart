import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart' show Color;

import '../common.dart' show NotionColors;

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class TimeCategory with _$TimeCategory {
  const TimeCategory._();

  @JsonSerializable(explicitToJson: true)
  factory TimeCategory({
    required String name,
    @JsonKey(name: 'children') required List<DateDuration> durations,
  }) = _TimeCategory;

  Color get color {
    switch (name) {
      case '🇲🇭 Technology':
        return NotionColors.fgBlue;
      case '🎨 Art':
        return NotionColors.fgOrange;
      case '🎷 Music':
        return NotionColors.fgPurple;
    }
    return NotionColors.bg;
  }

  factory TimeCategory.fromJson(Map<String, dynamic> json) => _$TimeCategoryFromJson(json);

  static toList(List<dynamic> categories) =>
      categories.map<TimeCategory>((i) => TimeCategory.fromJson(i)).toList();
}

@freezed
class DateDuration with _$DateDuration {
  const DateDuration._();

  @JsonSerializable(explicitToJson: true)
  factory DateDuration({
    @JsonKey(name: 'name') required String date,
    required int duration,
  }) = _DateDuration;

  factory DateDuration.fromJson(Map<String, dynamic> json) => _$DateDurationFromJson(json);

  // static toList(List<dynamic> goals) => goals.map<DateDuration>((i) => DateDuration.fromJson(i)).toList();
}
