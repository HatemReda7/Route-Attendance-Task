import 'package:attendance_task_route/core/utils/app_images.dart';
import 'package:attendance_task_route/features/Home%20Layout/data/models/ProductModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';

class ProductListItem extends StatelessWidget {
  Products product;

  ProductListItem({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.w,
      height: 300.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent, width: 1),
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
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
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title ?? "",
                  style:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),
                ),
                Text(
                  product.description ?? "",
                  style:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 3.w,
                ),
                Text("EGP ${product.price}",style:
                    TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),),
                Row(
                  children: [
                    Text(
                      "Review (${product.rating})",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 11.sp),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    SizedBox(width: 10.w,),
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
        ],
      ),
    );
  }
}
