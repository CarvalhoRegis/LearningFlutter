import 'package:api_aula/src/model/to_model.dart';
import 'package:api_aula/src/repositories/to_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  List<ToModel> todos = [];
  final ToRepository repository;
  //final altera ela mas sim o atributo dela(dentro)
  final state = ValueNotifier<HomeSate>(HomeSate.start);
  //HomeSate state = HomeSate.start;

  //infinitescroll
  int page = 1;
  int limit = 5;

  HomeController([ToRepository? repository])
      : repository = repository ?? ToRepository(Dio());

  // final repository = ToRepository(Dio()); // duvida

  Future start() async {
    //infinite scroll
    var toDo = repository.fetchTodos(page: page, limit: limit);

    state.value = HomeSate.loading;
    try {
      todos = await repository.fetchTodos();
      state.value = HomeSate.sucess;
    } catch (e) {
      state.value = HomeSate.error;
    }
    //scroll
    page++;
  }

  controllerScroll(){
    
  }

  void addListener(Null Function() param0) {}
}

enum HomeSate { start, loading, sucess, error }
