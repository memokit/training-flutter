class TodoModel {
  String? id;
  DateTime? createdAt;
  String? name;
  String? avatar;

  TodoModel({
    this.id,
    this.createdAt,
    this.name,
    this.avatar,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        id: json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        name: json["name"],
        avatar: json["avatar"],
      );
}
