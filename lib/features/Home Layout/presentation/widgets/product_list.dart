import 'package:attendance_task_route/features/Home%20Layout/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'product_list_item.dart';

class ProductList extends StatelessWidget {
  final List<Products> allProducts;
  const ProductList({required this.allProducts,super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.all(5.r),
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16),
        itemCount: allProducts.length,
        itemBuilder: (context, index) {
          return ProductListItem(
            product: allProducts[index],
          );
        },
      ),
    );
  }
}
