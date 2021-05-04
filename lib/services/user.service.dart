import 'dart:async';
import 'dart:convert';

import 'package:flutter_list_with_detail/models/user.dart';
import 'package:http/http.dart' as http;

Future<List<User>> fetchUser() async {
  final response =
      await http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<User>((json) => User.fromJson(json)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load User');
  }
}
