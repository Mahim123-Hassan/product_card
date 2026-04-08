import 'dart:convert';

import 'package:api_call_practitce/CRUD/widget/utils/urls.dart';

import 'product_model.dart';
import 'package:http/http.dart'as http;
class Productcontroller {
  List<Data>products=[];
  Future fetchproduct()async{
    final response= await http.get(Uri.parse(Urls.readProduct));
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      final data=jsonDecode(response.body);
      productModel model =    productModel.fromJson(data);
      products =model.data??[];
    }

  }



  Future<bool>DeleteProduct(String productId)async{
    final response=await http.get(Uri.parse(Urls.deleteproduct(productId)));
    if(response.statusCode==200){
      return true;
    }else{
      return false;
    }
  }

}