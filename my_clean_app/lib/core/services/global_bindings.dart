import 'package:get/get.dart';
import 'package:my_clean_app/core/services/dio_client.dart';
import 'package:my_clean_app/data/repositories/todo_repository_impl.dart';

class GlobalBindings {
  static init() {
    Get.lazyPut(
      () => DioClient(),
      fenix: true,
    );
    Get.lazyPut(
      () => TodoRepositoryImpl(Get.find<DioClient>()),
      fenix: true,
    );
  }
}
