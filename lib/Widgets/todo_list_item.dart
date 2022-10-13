import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../models/Todo.dart';
import 'package:intl/intl.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({
    Key? key, required this.todo, required this.onDelet,}) : super(key: key);

  final Todo todo;
  final Function(Todo) onDelet;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Container(

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.grey[200]),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              Text(
                DateFormat('dd/MMM/yyyy - HH:mm').format(todo.dateTime),
                style: TextStyle(fontSize: 12),
              ),

              Text(
                todo.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.25,
        children: [
          SlidableAction(
            label: 'Excluir',
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(10),
            icon: Icons.delete_forever,
            onPressed: (Ondelet) {
              onDelet(todo);
            },
          ),
        ],
      ),
    );
  }
}
