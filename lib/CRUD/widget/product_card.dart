import 'package:api_call_practitce/CRUD/widget/productcontroller.dart';
import 'package:flutter/material.dart';

import 'froduct_file.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  Productcontroller productcontroller= Productcontroller();
 // @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productcontroller.fetchproduct();
  }
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Product CRUD"),
        backgroundColor: Colors.green,
      ),
      body: GridView.builder(
        itemCount: productcontroller.products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (context, index) {
          var product=productcontroller.products[index];
          return product_file(product: product);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
    );
  }
}


