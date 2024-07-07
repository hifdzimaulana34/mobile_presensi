class Schedule {
  Schedule({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int categoryId;
  String name;
  String startTime;
  String endTime;
  String createdAt;
  String updatedAt;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        id: json['id'],
        categoryId: json['category_id'],
        name: json['name'],
        startTime: json['start_time'],
        endTime: json['end_time'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'category_id': categoryId,
        'name': name,
        'start_time': startTime,
        'end_time': endTime,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  Schedule.empty()
      : id = 0,
        categoryId = 0,
        name = '',
        startTime = '',
        endTime = '',
        createdAt = '',
        updatedAt = '';
}
