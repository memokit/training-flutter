import 'package:dio/dio.dart';
import 'package:my_app/training-6/dio/dio_client.dart';
import 'package:my_app/training-6/models/todo_model.dart';

class TodoService {
  final DioClient dioClient = DioClient();

  Future<List<TodoModel>> fetchData() async {
    try {
      Response response = await dioClient.dio.get('/page');

      if (response.statusCode == 200) {
        response.data = List<TodoModel>.from(
          response.data.map((x) => TodoModel.fromJson(x)),
        );
        return response.data;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<TodoModel> getData(String id) async {
    TodoModel data = TodoModel();
    try {
      Response response = await dioClient.dio.get('/page/$id');

      if (response.statusCode == 200) {
        data = TodoModel.fromJson(response.data);
      }
    } catch (e) {}
    return data;
  }

  Future<bool> save(String name) async {
    try {
      Map<String, dynamic> body = {
        "name": name,
        "avatar": "",
      };

      Response response = await dioClient.dio.post('/page', data: body);

      return response.statusCode == 201;
    } catch (e) {
      return false;
    }
  }

  Future<bool> update(String id, String name) async {
    try {
      Map<String, dynamic> body = {
        "name": name,
      };

      Response response = await dioClient.dio.put('/page/$id', data: body);

      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  Future<bool> delete(String id) async {
    try {
      Response response = await dioClient.dio.delete('/page/$id');

      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
