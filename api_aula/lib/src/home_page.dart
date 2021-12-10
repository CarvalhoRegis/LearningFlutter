// import 'dart:html';

import 'package:api_aula/src/controller/home_controller.dart';
import 'package:api_aula/src/repositories/to_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  //>>controllerscroll<<
  // late Future<List<String>> toDo;
  // List<String> _data = [];
  // int _carregaPag = 0, _limit = 5;
  // ScrollController _controller =
  //     ScrollController(initialScrollOffset: 0.0, keepScrollOffset: true);

  final ScrollController _controller = ScrollController();

  //>>Construtor para o scroll<<
  // void addListener () {
  //   _controller.addListener(() {
  //     var End = _controller.offset == _controller.position.maxScrollExtent;
  //     if (End) {
  //       setState(() {
  //         // controller.repository.fetchTodos(page: page, limit: limit);
  //         todos.addAll(
  //             controller.repository.fetchTodos(page: page, limit: limit));
  //       });
  //       page++;
  //     }
  //   });
  // }

  _sucess() {
    return ListView.builder(
      controller: _controller,
      itemCount: controller.todos.length, //tanto de itens que vai pegar list
      itemBuilder: (context, int index) {
        var todo = controller.todos[index];
        //return ListTile(title: Text('Item $index'));
        return ListTile(
          leading: Image.network(todo.thumbnailUrl),
          title: Text(todo.title),
          subtitle: Text(todo.url),
        );
      },
    );
  }

  _error() {
    return Center(
      // ignore: deprecated_member_use
      child: RaisedButton(
        onPressed: () {
          controller.start();
        }, // se der erro pode chamar novamente o star em estado de erro
        child: Text('Tentar Novamente\s'),
      ),
    );
  }

  _loading() {
    return const Center(
        // ignore: deprecated_member_use
        child: CircularProgressIndicator());
  }

  _start() {
    return Container();
  }

  stateManagement(HomeSate state) {
    switch (state) {
      case HomeSate.start:
        return _start();
      case HomeSate.loading:
        return _loading();
      case HomeSate.error:
        return _error();
      case HomeSate.sucess:
        return _sucess();
      default:
        return _start(); //se passar algo nulo
    }
  }

  scrollControllerListener() {
    _controller.addListener(() async {
      var End = _controller.offset == _controller.position.maxScrollExtent;
      if (End) {
        var novosTodos = await controller.fetchTodos();
        setState(() {
          controller.todos.addAll(novosTodos);
        });
      }
    });
  }

  @override //pegar a api da internet
  void initState() {
    super.initState();
    scrollControllerListener();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista API\'s ${controller.todos.length}'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh_outlined),
            onPressed: () {
              controller.start();
            },
          )
        ],
      ),
      body: AnimatedBuilder(
        animation: controller.state,
        builder: (
          context,
          child,
        ) {
          return stateManagement(controller.state.value);
        },
      ),
    );
  }
}
//duas paginas 10 em 10
//fetch todos
//listner mais um fetch pagina 2 do que tem a te adcionar eles 
/*carregamento infinito - facebook

tempo de loading para carregar mais conteudo 

infinitescroll -

add
commit
pull

push */