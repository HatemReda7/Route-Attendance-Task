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
          style: mainText.copyWith(color: secondry, fontSize: 20.sp),
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
                height: 300.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(product.thumbnail ?? ""),
                    fit: BoxFit.contain,
                  ),
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                product.title ?? "",
                style: mainText,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                child: Row(
                  children: [
                    Text(
                      "EGP ${product.price}",
                      style: mainText,
                    ),
                    const Spacer(),
                    Container(
                      width: 120.w,
                      height: 45.h,
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2.w,
                            strokeAlign: BorderSide.strokeAlignCenter),
                        borderRadius: BorderRadius.circular(20.r),
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
                  SizedBox(width: 10.w),
                  Text(
                    "(${product.rating})",
                    style: description,
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Container(
                width: 140.w,
                height: 50.h,
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
              SizedBox(height: 20.h),
              Text(
                "Description",
                style: mainText.copyWith(fontSize: 16.sp),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                product.description ?? "",
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: mainText.copyWith(
                    fontWeight: FontWeight.w300, fontSize: 12.sp),
              ),
              SizedBox(height: 20.h),
              Text(
                "Reviews",
                style: mainText,
              ),
              SizedBox(height: 20.h),
              product.reviews != null && product.reviews!.isNotEmpty
                  ? SizedBox(
                      height: 200.h,
                      child: ListView.builder(
                        itemCount: product.reviews!.length,
                        itemBuilder: (context, index) {
                          final review = product.reviews![index];
                          return Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: Card(
                              child: Padding(
                                padding: EdgeInsets.all(10.w),
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
                                          fontSize: 12.sp),
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
                    )
                  : Center(
                      child: Text(
                      "No Reviews!",
                      style: mainText,
                    )),
              SizedBox(height: 15.h),
              Text(
                "Total Price",
                style: mainText.copyWith(color: secondry, fontSize: 18.sp),
              ),
              SizedBox(height: 15.h),
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
                      style:
                          mainText.copyWith(fontSize: 16.sp, color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
