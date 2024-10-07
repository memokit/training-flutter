import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_clean_app/data/models/response_model.dart';
import 'package:my_clean_app/data/models/todo_model.dart';
import 'package:my_clean_app/domain/repositories/todo_repository.dart';
import 'package:my_clean_app/domain/usecases/todo/get_todo_data_use_case.dart';

class MockNewsRepo extends Mock implements TodoRepository {}

void main() {
  late MockNewsRepo mockRepo;
  late GetTodoDataUseCase usecases;

  setUp(() {
    mockRepo = MockNewsRepo();
    usecases = GetTodoDataUseCase(mockRepo);
  });
  group("Todo test", () {
    String id = "1";
    test("get todo data success", () async {
      TodoModel todoMockData = TodoModel(id: "1", name: "indy");

      when(() {
        return mockRepo.getData(id);
      }).thenAnswer((_) async {
        return ResponseModel(data: todoMockData, statusCode: 200);
      });

      final ResponseModel response = await usecases.call(id);
      TodoModel todoData = response.data;

      expect(todoData.name, "indy");
    });
  });
}
