import 'package:flutter/material.dart';
import 'package:flutter_list_with_detail/models/todo.dart';

class TodoListCard extends StatelessWidget {
  final Todo item;

  TodoListCard(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(color: buildColor()),
        child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Title : " + item.title,
                  style: TextStyle(color: buildTextColor()),
                ),
                Text(
                  "State : " + (item.completed ? 'Completed' : 'Not Completed'),
                  style: TextStyle(color: buildTextColor()),
                )
              ],
            )));
  }

  Color buildColor() {
    return item.completed ? Colors.green : Colors.red;
  }

  Color buildTextColor() {
    return Colors.white;
  }
}
