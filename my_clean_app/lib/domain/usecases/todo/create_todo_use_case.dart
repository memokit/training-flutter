import 'package:my_clean_app/core/usecase/usecase.dart';
import 'package:my_clean_app/data/models/response_model.dart';
import 'package:my_clean_app/domain/repositories/todo_repository.dart';

class CreateTodoUseCase implements ParamUseCase<ResponseModel, String> {
  final TodoRepository repository;
  CreateTodoUseCase(this.repository);

  @override
  Future<ResponseModel> call(String name) async {
    return repository.create(name);
  }
}
