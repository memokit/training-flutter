import 'package:my_clean_app/core/usecase/usecase.dart';
import 'package:my_clean_app/data/models/response_model.dart';
import 'package:my_clean_app/domain/repositories/todo_repository.dart';
import 'package:tuple/tuple.dart';

class UpdateTodoUseCase
    implements ParamUseCase<ResponseModel, Tuple2<String, String>> {
  final TodoRepository repository;
  UpdateTodoUseCase(this.repository);

  @override
  Future<ResponseModel> call(Tuple2<String, String> params) async {
    return repository.update(params.item1, params.item2);
  }
}
