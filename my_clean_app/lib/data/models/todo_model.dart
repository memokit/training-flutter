import 'package:my_clean_app/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  String? id;
  DateTime? createdAt;
  String? name;
  String? avatar;

  TodoModel({
    this.id,
    this.createdAt,
    this.name,
    this.avatar,
  }) : super(
          id: id,
          createdAt: createdAt,
          name: name,
          avatar: avatar,
        );

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        id: json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        name: json["name"],
        avatar: json["avatar"],
      );
}
