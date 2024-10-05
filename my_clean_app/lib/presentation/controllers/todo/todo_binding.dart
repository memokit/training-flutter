import 'package:get/get.dart';
import 'package:my_clean_app/data/repositories/todo_repository_impl.dart';
import 'package:my_clean_app/domain/usecases/todo/create_todo_use_case.dart';
import 'package:my_clean_app/domain/usecases/todo/delete_todo_use_case.dart';
import 'package:my_clean_app/domain/usecases/todo/get_todo_data_use_case.dart';
import 'package:my_clean_app/domain/usecases/todo/get_todo_list_use_case.dart';
import 'package:my_clean_app/domain/usecases/todo/update_todo_use_case.dart';
import 'package:my_clean_app/presentation/controllers/todo/todo_controller.dart';
import 'package:my_clean_app/presentation/controllers/todo/todo_detail_controller.dart';

class TodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CreateTodoUseCase(Get.find<TodoRepositoryImpl>()),
      fenix: true,
    );
    Get.lazyPut(
      () => CreateTodoUseCase(Get.find<TodoRepositoryImpl>()),
      fenix: true,
    );
    Get.lazyPut(
      () => UpdateTodoUseCase(Get.find<TodoRepositoryImpl>()),
      fenix: true,
    );
    Get.lazyPut(
      () => DeleteTodoUseCase(Get.find<TodoRepositoryImpl>()),
      fenix: true,
    );
    Get.lazyPut(
      () => GetTodoListUseCase(Get.find<TodoRepositoryImpl>()),
      fenix: true,
    );
    Get.lazyPut(
      () => GetTodoDataUseCase(Get.find<TodoRepositoryImpl>()),
      fenix: true,
    );

    Get.lazyPut(
        () => TodoController(
              createTodoUseCase: Get.find(),
              getTodoListUseCase: Get.find(),
              deleteTodoUseCase: Get.find(),
            ),
        fenix: true);
    Get.lazyPut(
        () => TodoDetailController(
              updateTodoUseCase: Get.find(),
              getTodoDataUseCase: Get.find(),
            ),
        fenix: true);
  }
}
