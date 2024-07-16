import 'dart:convert';
import 'package:attendance_task_route/core/utils/constants.dart';
import 'package:attendance_task_route/features/Home%20Layout/data/models/product_model.dart';
import 'package:attendance_task_route/features/Home%20Layout/domain/repositories/home_tab_repo.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class HomeTabRemote extends HomeRepo{
  @override
  Future<ProductModel> getAllProducts() async{
    Uri url = Uri.https(baseUrl, endPoint, {});
    Response response=await http.get(url);
    var jsonData=jsonDecode(response.body);
    ProductModel data= ProductModel.fromJson(jsonData);
    return data;
  }
}