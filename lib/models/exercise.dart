class Exercise {
  String pictureUrl;
  String volume;
  String description;
  String id;
  String name;

  Exercise({
    required this.pictureUrl,
    required this.volume,
    required this.description,
    required this.id,
    required this.name
  });

  static Exercise fromJson(Map<String, dynamic> json) {
    return Exercise(
        pictureUrl: json['pictureUrl'],
        description: json['description'],
        volume: json['volume'],
        id: json['id'],
        name: json['name']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pictureUrl'] = this.pictureUrl;
    data['volume'] = this.volume;
    data['description'] = this.description;
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}