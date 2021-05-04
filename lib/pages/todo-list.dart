import 'package:flutter/material.dart';
import 'package:flutter_list_with_detail/models/todo.dart';
import 'package:flutter_list_with_detail/services/todos.service.dart';
import 'package:flutter_list_with_detail/widgets/todo-list-card.dart';

class TodoList extends StatefulWidget {
  TodoList({Key key,this.userId}) : super(key: key);

  final int userId;

  @override
  _TodoListState createState() => _TodoListState(userId);
}

class _TodoListState extends State<TodoList> {

  final int userId;
  
  Future<List<Todo>> todoList;

  _TodoListState(this.userId);


  @override
  void initState() {
    super.initState();
    todoList = fetchTodo(userId);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
       child: Container(
        child: FutureBuilder<List<Todo>>(
          future: todoList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // return Text(snapshot.data!.title);
              return ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      SizedBox(height: 1),
                      TodoListCard(snapshot.data[index]),
                      SizedBox(height: 1)
                    ],
                    
                  );
                },
                itemCount: snapshot.data.length,
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}