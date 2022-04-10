import 'package:fizjo/models/exercise.dart';
import 'package:json_annotation/json_annotation.dart';
part 'exercise-set-detailed.g.dart';

@JsonSerializable()
class ExerciseSetDetailed {
  String id;
  String name;
  List<Exercise> exercises;

  ExerciseSetDetailed(
    this.id,
    this.name,
    this.exercises
  );

  factory ExerciseSetDetailed.fromJson(Map<String, dynamic> json) => _$ExerciseSetDetailedFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseSetDetailedToJson(this);
}