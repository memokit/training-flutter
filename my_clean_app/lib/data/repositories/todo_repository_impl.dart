import 'package:dio/dio.dart';
import 'package:my_clean_app/core/services/dio_client.dart';
import 'package:my_clean_app/data/models/response_model.dart';
import 'package:my_clean_app/data/models/todo_model.dart';
import 'package:my_clean_app/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final DioClient dioClient;

  TodoRepositoryImpl(this.dioClient);
  @override
  Future<ResponseModel> create(String name) async {
    ResponseModel responseModel = ResponseModel();
    try {
      Map<String, dynamic> body = {
        "name": name,
        "avatar": "",
      };

      Response response = await dioClient.dio.post('/page', data: body);

      responseModel.data = response.statusCode == 201;
    } catch (e) {
      responseModel.data = false;
    }
    return responseModel;
  }

  @override
  Future<ResponseModel> delete(String id) async {
    ResponseModel responseModel = ResponseModel();
    try {
      Response response = await dioClient.dio.delete('/page/$id');
      responseModel.data = response.statusCode == 200;
    } catch (e) {
      responseModel.data = false;
    }
    return responseModel;
  }

  @override
  Future<ResponseModel> getData(String id) async {
    ResponseModel responseModel = ResponseModel();
    try {
      Response response = await dioClient.dio.get('/page/$id');

      if (response.statusCode == 200) {
        responseModel.data = TodoModel.fromJson(response.data);
      }
    } catch (e) {
      responseModel.data = TodoModel();
    }
    return responseModel;
  }

  @override
  Future<ResponseModel> getList() async {
    ResponseModel responseModel = ResponseModel();
    try {
      Response response = await dioClient.dio.get('/page');

      if (response.statusCode == 200) {
        response.data = List<TodoModel>.from(
          response.data.map((x) => TodoModel.fromJson(x)),
        );
        responseModel.data = response.data;
      } else {
        responseModel.data = [];
      }
    } catch (e) {
      responseModel.data = [];
    }

    return responseModel;
  }

  @override
  Future<ResponseModel> update(String id, String name) async {
    ResponseModel responseModel = ResponseModel();
    try {
      Map<String, dynamic> body = {
        "name": name,
      };

      Response response = await dioClient.dio.put('/page/$id', data: body);

      responseModel.data = response.statusCode == 200;
    } catch (e) {
      responseModel.data = false;
    }
    return responseModel;
  }
}
