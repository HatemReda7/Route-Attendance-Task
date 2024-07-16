import 'package:attendance_task_route/core/utils/app_images.dart';
import 'package:attendance_task_route/features/Home%20Layout/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';

class ProductListItem extends StatelessWidget {
  final Products product;

  const ProductListItem({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 2),
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 60.h,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.network(product.thumbnail ?? ""),
                Positioned(
                  right: 5,
                  top: 5,
                  child: Container(
                    height: 30,
                    width: 30,
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
              padding: EdgeInsets.symmetric(horizontal: 7.w,vertical: 5.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title ?? "",
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp,),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 3.h,),
                  Text(
                    product.description ?? "",
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5.h,),
                  Text("EGP ${product.price}",style:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        "Review (${product.rating})",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 10.sp),
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      SizedBox(width: 15.w,),
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
    );
  }
}
