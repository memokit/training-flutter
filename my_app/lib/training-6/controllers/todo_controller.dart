import 'package:get/get.dart';
import 'package:my_app/training-6/models/todo_model.dart';
import 'package:my_app/training-6/services/todo_service.dart';

class TodoController extends GetxController with StateMixin<List<TodoModel>> {
  var posts = [].obs; // สร้าง observable ที่สามารถติดตามการเปลี่ยนแปลงได้
  var isLoading = false.obs; // สถานะการโหลดข้อมูล

  @override
  onInit() {
    super.onInit();
  }

  @override
  onReady() async {
    super.onReady();
    await fetchData();
  }

  Future<void> fetchData() async {
    try {
      change([], status: RxStatus.loading());

      List<TodoModel> data = await TodoService().fetchData();

      change(data, status: RxStatus.success());
    } catch (e) {}
  }

  Future<void> save(String name) async {
    try {
      bool result = await TodoService().save(name);

      if (result) {
        Get.snackbar("สำเร็จ", "บันทึกสำเร็จ");
        await fetchData();
      }
    } catch (e) {}
  }

  delete(String id) async {
    try {
      bool result = await TodoService().delete(id);

      if (result) {
        Get.snackbar("สำเร็จ", "ลบสำเร็จ");
        await fetchData();
      }
    } catch (e) {}
  }
}
