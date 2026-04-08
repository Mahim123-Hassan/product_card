import 'package:api_call_practitce/CRUD/widget/productcontroller.dart';
import 'package:flutter/material.dart';

import 'froduct_file.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  Productcontroller productController = Productcontroller();
  // @override
  Future fetchData() async {
    await productController.fetchproduct();
    setState(() {});
  }

  productDialog({
    String? name,
    String? id,
    String? img,
    int? qty,
    int? uniPrice,
    int? totalPrice,
    required bool isUpdate,
  }) {
    TextEditingController productNameController=TextEditingController();
    TextEditingController productIMGeController=TextEditingController();
    TextEditingController productQTYController=TextEditingController();
    TextEditingController productUnitController=TextEditingController();
    TextEditingController productTotalPriceController=TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isUpdate ? "Update Product" : 'Add Product'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: productNameController,
              decoration: InputDecoration(
                labelText: "Product name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: productIMGeController,
              decoration: InputDecoration(
                labelText: "Product image",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: productQTYController,
              decoration: InputDecoration(
                labelText: "Product qty",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: productUnitController,
              decoration: InputDecoration(
                labelText: "Product unit price",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: productTotalPriceController,
              decoration: InputDecoration(
                labelText: "Product total Price",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: .spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancle"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(5),
                    ),
                  ),
                  onPressed: () {
                    print(productNameController.text);
                  },
                  child: Text("Update"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product CRUD"),
        backgroundColor: Colors.green,
      ),
      body: GridView.builder(
        itemCount: productController.products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (context, index) {
          var product = productController.products[index];
          return product_file(
            product: product,
            onDelete: () async {
              productController.DeleteProduct(product.sId.toString()).then((
                value,
              ) async {
                if (value) {
                  await productController.fetchproduct();
                  setState(() {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("product Deleted")));
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Something wrong....!")),
                  );
                }
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          productDialog(isUpdate: false);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
    );
  }
}
