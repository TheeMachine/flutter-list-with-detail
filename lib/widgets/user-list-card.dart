import 'package:flutter/material.dart';
import 'package:flutter_list_with_detail/models/user.dart';

class UserListCard extends StatelessWidget {
  final User item;

  UserListCard(this.item);

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
                Text("User Name: " + item.name,style: TextStyle(color: buildTextColor()),),
                Text("User Email: " + item.email,style: TextStyle(color: buildTextColor()),)
              ],
            )));
  }

  Color buildColor() {
    return item.id % 2 == 0 ? Colors.green : Colors.white;
  }

  Color buildTextColor() {
    return item.id % 2 == 0 ? Colors.white : Colors.black;
  }
}
