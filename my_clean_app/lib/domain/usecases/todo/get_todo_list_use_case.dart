import 'package:my_clean_app/core/usecase/usecase.dart';
import 'package:my_clean_app/data/models/response_model.dart';
import 'package:my_clean_app/domain/repositories/todo_repository.dart';

class GetTodoListUseCase implements NoParamUseCase<ResponseModel> {
  final TodoRepository repository;
  GetTodoListUseCase(this.repository);

  @override
  Future<ResponseModel> call() async {
    return repository.getList();
  }
}
