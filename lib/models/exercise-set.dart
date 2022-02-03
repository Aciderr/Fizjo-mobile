class ExerciseSet {
  String id;
  String name;

  ExerciseSet({
    required this.id,
    required this.name
  });

  static ExerciseSet fromJson(Map<String, dynamic> json) {
    return ExerciseSet(
        id: json['id'],
        name: json['name']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}