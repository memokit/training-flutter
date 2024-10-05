import 'package:my_clean_app/core/usecase/usecase.dart';
import 'package:my_clean_app/data/models/response_model.dart';
import 'package:my_clean_app/domain/repositories/todo_repository.dart';

class GetTodoDataUseCase implements ParamUseCase<ResponseModel, String> {
  final TodoRepository repository;
  GetTodoDataUseCase(this.repository);

  @override
  Future<ResponseModel> call(String id) async {
    return repository.getData(id);
  }
}
