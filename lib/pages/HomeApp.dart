import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/Widgets/todo_list_item.dart';
import 'package:lista_de_tarefas/models/Todo.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomeApp extends StatefulWidget {
  HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  final TextEditingController textController = TextEditingController();

  List<Todo> todos = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: textController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Adicione uma Tarefa',
                          hintText: 'Ex.: Estudar Flutter',
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        String text = textController.text;
                        setState(() {
                          Todo newTodo = Todo(
                            title: text,
                            dateTime: DateTime.now(),
                          );
                          todos.add(newTodo);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Flexible(
                  //listas
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (Todo todo in todos)
                        TodoListItem(
                          todo: todo,
                          onDelet: onDelet,
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    Expanded(
                      child:
                          Text('Você possui ${todos.length} Tarefas pendentes'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.all(14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text('Limpar tudo'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onDelet(Todo todo) {
    setState(() {
      todos.remove(todo);
    });
  }

  void login(Todo todo) {
    String text = textController.text;
    print(text);
  }
}
