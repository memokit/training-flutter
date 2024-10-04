import 'package:dio/src/response.dart' as resp;
import 'package:get/get.dart';
import 'package:my_app/training-6/dio/dio_client.dart';
import 'package:my_app/training-6/models/todo_model.dart';

class TodoController extends GetxController with StateMixin<List<TodoModel>> {
  var posts = [].obs; // สร้าง observable ที่สามารถติดตามการเปลี่ยนแปลงได้
  var isLoading = false.obs; // สถานะการโหลดข้อมูล
  final DioClient dioClient;

  TodoController(this.dioClient);

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

      resp.Response response = await dioClient.dio.get('/page');

      response.data = List<TodoModel>.from(
        response.data.map((x) => TodoModel.fromJson(x)),
      );

      change(response.data, status: RxStatus.success());
    } catch (e) {}
  }

  Future<void> save(String name) async {
    try {
      Map<String, dynamic> body = {
        "name": name,
        "avatar": "",
      };

      resp.Response response = await dioClient.dio.post('/page', data: body);

      if (response.statusCode == 201) {
        Get.snackbar("สำเร็จ", "บันทึกสำเร็จ");
        await fetchData();
      }
    } catch (e) {}
  }

  delete(String id) async {
    try {
      resp.Response response = await dioClient.dio.delete('/page/$id');
      if (response.statusCode == 200) {
        Get.snackbar("สำเร็จ", "ลบสำเร็จ");
        await fetchData();
      }
    } catch (e) {}
  }
}
