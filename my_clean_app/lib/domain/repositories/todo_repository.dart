import 'package:my_clean_app/data/models/response_model.dart';

abstract class TodoRepository {
  Future<ResponseModel> getList();
  Future<ResponseModel> getData(String id);
  Future<ResponseModel> create(String name);
  Future<ResponseModel> update(String id, String name);
  Future<ResponseModel> delete(String id);
}
