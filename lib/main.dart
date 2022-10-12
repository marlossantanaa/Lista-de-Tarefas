import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/pages/HomeApp.dart';

void main() {
  runApp(ListaTarefas());
}

class ListaTarefas extends StatelessWidget {
  const ListaTarefas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeApp(),
    );
  }
}
