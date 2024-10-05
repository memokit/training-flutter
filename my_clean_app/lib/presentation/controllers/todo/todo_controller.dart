import 'package:get/get.dart';
import 'package:my_clean_app/data/models/response_model.dart';
import 'package:my_clean_app/data/models/todo_model.dart';
import 'package:my_clean_app/domain/usecases/todo/create_todo_use_case.dart';
import 'package:my_clean_app/domain/usecases/todo/delete_todo_use_case.dart';
import 'package:my_clean_app/domain/usecases/todo/get_todo_list_use_case.dart';

class TodoController extends GetxController with StateMixin<List<TodoModel>> {
  final GetTodoListUseCase getTodoListUseCase;
  final CreateTodoUseCase createTodoUseCase;
  final DeleteTodoUseCase deleteTodoUseCase;

  TodoController({
    required this.getTodoListUseCase,
    required this.createTodoUseCase,
    required this.deleteTodoUseCase,
  });

  var posts = [].obs; // สร้าง observable ที่สามารถติดตามการเปลี่ยนแปลงได้
  var isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
  }

  @override
  onReady() async {
    super.onReady();
    await getList();
  }

  Future<void> getList() async {
    try {
      change([], status: RxStatus.loading());

      ResponseModel result = await getTodoListUseCase.call();

      change(result.data, status: RxStatus.success());
    } catch (e) {}
  }

  Future<void> create(String name) async {
    try {
      ResponseModel result = await createTodoUseCase.call(name);

      if (result.data) {
        Get.snackbar("สำเร็จ", "บันทึกสำเร็จ");
        await getList();
      }
    } catch (e) {}
  }

  delete(String id) async {
    try {
      ResponseModel result = await deleteTodoUseCase.call(id);

      if (result.data) {
        Get.snackbar("สำเร็จ", "ลบสำเร็จ");
        await getList();
      }
    } catch (e) {}
  }
}
