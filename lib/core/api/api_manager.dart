import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../../features/Home Layout/data/models/product_model.dart';

class ApiManager{
  static Future<ProductModel> getAllProducts() async{
    Uri url = Uri.https("dummyjson.com", "/products", {});
    Response response=await http.get(url);
    var jsonData=jsonDecode(response.body);
    ProductModel data= ProductModel.fromJson(jsonData);
    return data;
  }
}