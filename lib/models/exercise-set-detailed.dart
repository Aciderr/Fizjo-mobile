import 'package:fizjo/models/exercise.dart';

class ExerciseSetDetailed {
  String id;
  String name;
  List<Exercise> exercises;

  ExerciseSetDetailed({
    required this.id,
    required this.name,
    required this.exercises
  });

  static ExerciseSetDetailed fromJson(Map<String, dynamic> json) {
    return ExerciseSetDetailed(
        id: json['id'],
        name: json['name'],
        exercises: (json['exercises'] as List<dynamic>).map((e) => Exercise.fromJson(e)).toList(),
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['name'] = name;
  //   data['exercises'] = exercises;
  //   return data;
  // }
}