
import 'package:api_call_practitce/coments_api.dart';
import 'package:api_call_practitce/crud.dart';
import 'package:api_call_practitce/CRUD/widget/product_card.dart';
import 'package:flutter/material.dart';

import 'apicall_test.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  ProductCard(),
    );
  }
}
