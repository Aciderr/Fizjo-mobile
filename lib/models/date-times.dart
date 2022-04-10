import 'package:json_annotation/json_annotation.dart';
part 'date-times.g.dart';

@JsonSerializable()
class DateTimes {
  String uuid;
  String time;
  List<int> days;

  DateTimes(
    this.uuid,
    this.time,
    this.days
  );

  factory DateTimes.fromJson(Map<String, dynamic> json) => _$DateTimesFromJson(json);

  Map<String, dynamic> toJson() => _$DateTimesToJson(this);
}