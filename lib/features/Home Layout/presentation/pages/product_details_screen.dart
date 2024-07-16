import 'package:attendance_task_route/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../data/models/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Products product;

  const ProductDetailsScreen(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Details",
          style: mainText.copyWith(color: secondry, fontSize: 20),
        ),
        actions: [
          ImageIcon(
            const AssetImage(search),
            size: 24.sp,
            color: secondry,
          ),
          SizedBox(width: 32.w),
          Image.asset(
            cart,
            color: secondry,
            height: 30.h,
            width: 30.w,
          ),
          SizedBox(width: 16.w),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200.h,
                width: 400.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(product.thumbnail ?? ""),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                product.title ?? "",
                style: mainText,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Row(
                  children: [
                    Text(
                      "EGP ${product.price}",
                      style: mainText,
                    ),
                    const Spacer(),
                    Container(
                      width: 100.w,
                      height: 35.h,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2.w,
                            strokeAlign: BorderSide.strokeAlignCenter),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "${product.stock} Left",
                        style: mainText,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 30.sp,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    "(${product.rating})",
                    style: description,
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Container(
                width: 120.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: secondry,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ImageIcon(
                      const AssetImage(subtract),
                      size: 25.sp,
                      color: Colors.white,
                    ),
                    Text(
                      "1",
                      textAlign: TextAlign.center,
                      style: mainText.copyWith(color: Colors.white),
                    ),
                    Icon(
                      Icons.add_circle_outline_rounded,
                      color: Colors.white,
                      size: 25.sp,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                "Description",
                style: mainText.copyWith(fontSize: 16),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                product.description ?? "",
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: mainText.copyWith(
                    fontWeight: FontWeight.w300, fontSize: 12),
              ),
              SizedBox(height: 15.h),
              Text(
                "Reviews",
                style: mainText,
              ),
              SizedBox(height: 15.h),
              if (product.reviews != null && product.reviews!.isNotEmpty)
                SizedBox(
                  height: 200.h, // Adjust height as needed
                  child: ListView.builder(
                    itemCount: product.reviews!.length,
                    itemBuilder: (context, index) {
                      final review = product.reviews![index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.all(8.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  review.reviewerName ?? "Anonymous",
                                  style: mainText,
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  review.comment ?? "",
                                  style: description.copyWith(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12),
                                ),
                                SizedBox(height: 5.h),
                                Row(
                                  children: List.generate(
                                    review.rating?.toInt() ?? 0,
                                    (index) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 15.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              SizedBox(height: 10.h),
              Text(
                "Total Price",
                style: mainText.copyWith(color: secondry, fontSize: 18),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text(
                    "EGP ${product.price}",
                    style: mainText,
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(secondry),
                        fixedSize: MaterialStatePropertyAll(Size(200.w, 40.h))),
                    onPressed: () {},
                    child: Text(
                      "Add to cart",
                      style: mainText.copyWith(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
            ],
          ),
        ),
      ),
    );
  }
}
