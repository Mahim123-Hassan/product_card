import 'package:api_call_practitce/CRUD/widget/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class product_file extends StatelessWidget {
  final Data product;
  final VoidCallback onDelete;


  const product_file({super.key, required this.product,required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: Image.network(
                (product.img != null &&
                        product.img.toString().startsWith('http'))
                    ? product.img.toString()
                    : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT811sfHEAgG8NqFXjYctX5K0WfeIRZ8JlmN9vM0Q9kdpZD0fzt-zYsNsk&s',
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
                  onPressed: onDelete,
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
