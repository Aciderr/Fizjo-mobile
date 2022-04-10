// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
      json['pictureUrl'] as String,
      json['volume'] as String,
      json['description'] as String,
      json['id'] as String,
      json['name'] as String,
    );

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'pictureUrl': instance.pictureUrl,
      'volume': instance.volume,
      'description': instance.description,
      'id': instance.id,
      'name': instance.name,
    };
