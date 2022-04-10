import 'package:json_annotation/json_annotation.dart';
part 'exercise.g.dart';

@JsonSerializable()
class Exercise {
  String pictureUrl;
  String volume;
  String description;
  String id;
  String name;

  Exercise(
    this.pictureUrl,
    this.volume,
    this.description,
    this.id,
    this.name
  );

  factory Exercise.fromJson(Map<String, dynamic> json) => _$ExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
}