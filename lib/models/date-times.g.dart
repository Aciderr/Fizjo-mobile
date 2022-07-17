// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date-times.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DateTimes _$DateTimesFromJson(Map<String, dynamic> json) => DateTimes(
      json['uuid'] as String,
      json['time'] as String,
      (json['days'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DateTimesToJson(DateTimes instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'time': instance.time,
      'days': instance.days,
    };
