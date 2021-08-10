import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import './models.dart' show Goal;

class Service {
  static Future<List<Goal>> fetchGoals() async {
    // TODO: Improve this
    String endpoint() {
      if (kReleaseMode)
        return "https://mpa-notion-widgets.netlify.app/functions/goals";
      return "http://localhost:8888/functions/goals";
    }

    final response = await Dio().get(endpoint());

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // if (response.data["object"] == "list") return "Success";
      // return Goal.toList(response.data as List<dynamic>);
      // print('Goal name: ${response.data[0]['name']}');
      // print(response.data.runtimeType);
      // final data = response.data as List<dynamic>;
      // return data.map<Goal>((i) => Goal.fromJson(jsonDecode(i))).toList();
      List<Goal> goals = (response.data as List)
          .map<Goal>((goal) => Goal.fromJson(goal))
          .toList();
      return goals;
      // return "Failure";
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load goals');
    }
  }
}
