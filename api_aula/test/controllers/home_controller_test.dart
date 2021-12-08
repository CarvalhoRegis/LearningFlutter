import 'package:api_aula/src/controller/home_controller.dart';
import 'package:api_aula/src/model/to_model.dart';
import 'package:api_aula/src/repositories/to_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class ToRepositoryMock extends Mock implements ToRepository {}

main() {
  final repository = ToRepositoryMock();
  final controller = HomeController();
  test('Deve preencher variavel todos', () async {
    // when(repository.fetchTodos()).thenAnswer((_) async => [ToModel()]);

    // await controller.start();
    // expect(controller.todos.isNotEmpty, true);
  });
}
