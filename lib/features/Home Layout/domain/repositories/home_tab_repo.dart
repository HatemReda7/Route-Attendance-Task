import 'package:attendance_task_route/features/Home%20Layout/data/models/product_model.dart';

abstract class HomeRepo {
  Future<ProductModel> getAllProducts();

}