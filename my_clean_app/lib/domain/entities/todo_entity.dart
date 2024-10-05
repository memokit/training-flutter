abstract class TodoEntity {
  final String? id;
  final DateTime? createdAt;
  final String? name;
  final String? avatar;

  TodoEntity({
    this.id,
    this.createdAt,
    this.name,
    this.avatar,
  });
}
