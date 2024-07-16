import 'package:attendance_task_route/core/utils/app_images.dart';
import 'package:attendance_task_route/core/utils/app_style.dart';
import 'package:attendance_task_route/features/Home%20Layout/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/app_routes.dart';
import '../../../../core/utils/app_colors.dart';

class ProductListItem extends StatelessWidget {
  final Products product;

  const ProductListItem({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.productDetailsScreen,
            arguments: {'product': product});
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 2.w),
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.white,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 140.h,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(product.thumbnail ?? ""),
                  Positioned(
                    right: 5.w,
                    top: 5.h,
                    child: Container(
                      height: 30.h,
                      width: 30.w,
                      decoration: ShapeDecoration(
                        color: primary,
                        shape: const OvalBorder(),
                      ),
                      child: Center(
                        child: ImageIcon(
                          const AssetImage(favorite),
                          color: secondry,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      product.title ?? "",
                      style: description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      product.description ?? "",
                      style: description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text("EGP ${product.price}", style: description),
                    Row(
                      children: [
                        Text(
                          "Review (${product.rating})",
                          style: description,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        const Spacer(),
                        Icon(
                          Icons.add_circle_rounded,
                          color: secondry,
                          size: 30.sp,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
