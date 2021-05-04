import 'package:flutter/material.dart';
import 'package:flutter_list_with_detail/models/user.dart';
import 'package:flutter_list_with_detail/pages/detail.dart';
import 'package:flutter_list_with_detail/services/user.service.dart';
import 'package:flutter_list_with_detail/widgets/user-list-card.dart';

class UserList extends StatefulWidget {
  UserList({Key key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  // final List<User> userList = [
  //   User(email: 'test@mail.com', id: 1, name: 'Test'),
  //   User(email: 'test@mail.com', id: 2, name: 'Test'),
  //   User(email: 'test@mail.com', id: 3, name: 'Test'),
  //   User(email: 'test@mail.com', id: 4, name: 'Test'),
  //   User(email: 'test@mail.com', id: 5, name: 'Test'),
  // ];

  Future<List<User>> userList;

  @override
  void initState() {
    super.initState();
    userList = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User List")),
      body: Container(
        child: FutureBuilder<List<User>>(
          future: userList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: UserListCard(snapshot.data[index]),
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              UserDetail(user: snapshot.data[index]),
                        ),
                      )
                    },
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
