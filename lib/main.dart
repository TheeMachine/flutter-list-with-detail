import 'package:flutter/material.dart';
import 'package:flutter_list_with_detail/pages/detail.dart';
import 'package:flutter_list_with_detail/pages/list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/list': (context) => UserList(),
        '/user-detail': (context) => UserDetail()
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter List Example')),
      body: Center(
          child: Container(
        child: ElevatedButton(
          child:
              Padding(padding: EdgeInsets.all(15.0), child: Text('Go to List',style: TextStyle(fontSize: 20.0),)),
          onPressed: () {
            Navigator.pushNamed(context, '/list');
          },
        ),
      )),
    );
  }
}
