class UserConfig {
  String userId;
  List<DateTimes> dateTimes;
  int createdAt;
  int updatedAt;
  int daysInRowExercising;
  String lastDayOfExercising;

  UserConfig({
    required this.userId,
    required this.dateTimes,
    required this.createdAt,
    required this.updatedAt,
    required this.daysInRowExercising,
    required this.lastDayOfExercising
  });

  static UserConfig fromJson(Map<String, dynamic> json) {
    var dateTimesTemporary = <DateTimes>[];
    if (json['dateTimes'] != null) {
      json['dateTimes'].forEach((v) {
        dateTimesTemporary.add(DateTimes.fromJson(v));
      });
    }
    return UserConfig(
      userId: json['userId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      daysInRowExercising: json['daysInRowExercising'],
      lastDayOfExercising: json['lastDayOfExercising'],
      dateTimes: dateTimesTemporary
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['dateTimes'] = dateTimes.map((v) => v.toJson()).toList();
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['daysInRowExercising'] = daysInRowExercising;
    data['lastDayOfExercising'] = lastDayOfExercising;
    return data;
  }
}

class DateTimes {
  String uuid;
  String time;
  List<int> days;

  DateTimes({
    required this.uuid,
    required this.time,
    required this.days
  });

  static DateTimes fromJson(Map<String, dynamic> json) {
    return DateTimes(
      uuid: json['uuid'],
      time: json['time'],
      days: json['days'].cast<int>()
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['time'] = time;
    data['days'] = days;
    return data;
  }
}