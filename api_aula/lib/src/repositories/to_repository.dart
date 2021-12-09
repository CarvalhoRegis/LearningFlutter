// import 'dart:html';

import 'package:api_aula/src/model/to_model.dart';
import 'package:dio/dio.dart';

class ToRepository {
  //acesso externo
  //Dio ja converte para json
  Dio dio; //declarando o dio ja convertendo para json
  final url = 'https://jsonplaceholder.typicode.com/photos?_start=0&_limit=5';

  ToRepository(this.dio, [Dio? client]) {
    dio = client ?? Dio();
    //refator o codigo abaixo
    /* if (client == null) {
      this.dio = Dio();
    } else {
      this.dio = client;
    } */
  }
  Future<List<ToModel>> fetchTodos({int page = 1, int limit = 5}) async {
    int start = (page - 1) * limit;
    var url = 'https://jsonplaceholder.typicode.com/photos?_start=$start&_limit=$limit';
    var result = dio.get(url);
    //loop para leitura da api
    final response = await dio.get(url);
    final list = response.data as List;

    return list.map((json) => ToModel.fromJson(json)).toList();
    //Refatórando descisão
    /*  List<ToModel> todos = [];
    for (var json in list) {
      final todo = ToModel.fromJson(json);
      todos.add(todo);
    }
    return todos; */
  }
}
