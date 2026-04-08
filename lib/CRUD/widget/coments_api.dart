import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ComentsApi extends StatefulWidget {
  const ComentsApi({super.key});

  @override
  State<ComentsApi> createState() => _ComentsApiState();
}

class _ComentsApiState extends State<ComentsApi> {
  List Users = [];
  Future fetchUser() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/comments"),
      headers: {"Accept": "application/json"},
    );
    print(response.body);
    if (response.statusCode == 200) {
      Users = jsonDecode(response.body);
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coments_Api"),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: Users.length,
        itemBuilder: (context, index) {
          final user=Users[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(user['name'][0], style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.purple,
            ),
            title: Text("name:${user['name']}"),
            subtitle: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  "Email:${user['email']}",
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  "body:${user['body']}",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
