// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise-set-detailed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseSetDetailed _$ExerciseSetDetailedFromJson(Map<String, dynamic> json) =>
    ExerciseSetDetailed(
      json['id'] as String,
      json['name'] as String,
      (json['exercises'] as List<dynamic>)
          .map((e) => Exercise.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExerciseSetDetailedToJson(
        ExerciseSetDetailed instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'exercises': instance.exercises,
    };
