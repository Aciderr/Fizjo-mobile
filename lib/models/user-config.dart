import 'package:fizjo/models/date-times.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user-config.g.dart';

@JsonSerializable()
class UserConfig {
  String userId;
  List<DateTimes> dateTimes;

  UserConfig(
    this.userId,
    this.dateTimes,
  );

  factory UserConfig.fromJson(Map<String, dynamic> json) => _$UserConfigFromJson(json);

  Map<String, dynamic> toJson() => _$UserConfigToJson(this);
}