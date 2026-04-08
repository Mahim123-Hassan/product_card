import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Crud extends StatefulWidget {
  const Crud({super.key});

  @override
  State<Crud> createState() => _CrudState();
}

class _CrudState extends State<Crud> {
  List users = [];
  Future fatchUser() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      headers: {'Accept': 'application/json'},
    );
    print(response.body);
    if (response.statusCode == 200) {
      users = jsonDecode(response.body);
    }
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    fatchUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Practes"),
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {

          final user = users[index];

          return ListTile(
            leading: CircleAvatar(
              child: Text('Ma'),
              backgroundColor: Colors.greenAccent,
            ),
            title: Text("id:${user['id']}"),
            subtitle: Column(
              crossAxisAlignment: .start,
              children: [
                Text("Title:${user['title']}", style: TextStyle(color: Colors.grey)),
                Text("body:${user['body']}", style: TextStyle(color: Colors.grey)),
              ],
            ),
          );
        },
      ),
    );
  }
}
