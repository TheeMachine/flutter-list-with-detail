import 'package:flutter/material.dart';
import 'package:flutter_list_with_detail/models/user.dart';
import 'package:flutter_list_with_detail/pages/todo-list.dart';

class UserDetail extends StatefulWidget {
  UserDetail({Key key, this.user}) : super(key: key);

  final User user;

  @override
  _UserDetailState createState() => _UserDetailState(this.user);
}

class _UserDetailState extends State<UserDetail> {
  final User user;

  

  _UserDetailState(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name + "'s Detail")),
        body: Center(
      child: TodoList(userId: user.id),
    ));
  }
}
