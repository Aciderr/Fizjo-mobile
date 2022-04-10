import 'package:json_annotation/json_annotation.dart';
part 'exercise-set.g.dart';

@JsonSerializable()
class ExerciseSet {
  String id;
  String name;

  ExerciseSet(
    this.id,
    this.name
  );

  factory ExerciseSet.fromJson(Map<String, dynamic> json) => _$ExerciseSetFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseSetToJson(this);
}