// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserConfig _$UserConfigFromJson(Map<String, dynamic> json) => UserConfig(
      json['userId'] as String,
      (json['dateTimes'] as List<dynamic>)
          .map((e) => DateTimes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserConfigToJson(UserConfig instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'dateTimes': instance.dateTimes,
    };
