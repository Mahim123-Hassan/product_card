import 'package:api_call_practitce/CRUD/widget/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class product_file extends StatelessWidget {

final Data product;

  const product_file({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: Image.network(
                product.img.toString()
              ),
            ),
            Text(
              product.productName.toString(),
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Text(
              "Price: \$${product.unitPrice}| QTY: ${product.qty}",
              style: TextStyle(color: Colors.green.shade200, fontSize: 17),
            ),
            Row(
              mainAxisAlignment: .spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit, color: Colors.green),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}