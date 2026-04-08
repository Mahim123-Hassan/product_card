import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApicallTest extends StatefulWidget {
  const ApicallTest({super.key});

  @override
  State<ApicallTest> createState() => _ApicallTestState();
}

class _ApicallTestState extends State<ApicallTest> {
  List users = [];
  Future fetchUser() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/users"),
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
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("ApicallTest"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            leading: CircleAvatar(
             // radius: 70,
              child: Text(user['name'][0]),
              backgroundColor: Colors.blue,
            ),
            title: Text(user["name"]),
            subtitle: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  "UserName:${user["username"]}",
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  "Email:${user["email"]}",
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  "phone:${user["phone"]}",
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  "Website:${user["website"]}",
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
