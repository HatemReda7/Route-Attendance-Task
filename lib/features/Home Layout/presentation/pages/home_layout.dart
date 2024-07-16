import 'package:attendance_task_route/core/api/api_manager.dart';
import 'package:attendance_task_route/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/product_list_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90.w,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Image.asset(
            blueroute,
            fit: BoxFit.contain,
            color: secondry,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        bottomOpacity: 0,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50.h,
                  width: 300.w,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "What do you search for?",
                      hintStyle: const TextStyle(fontWeight: FontWeight.w300),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide:
                              BorderSide(color: secondry, width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide:
                              BorderSide(color: secondry, width: 2)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide:
                              BorderSide(color: secondry, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide:
                              BorderSide(color: secondry, width: 2)),
                      prefixIcon: ImageIcon(
                        const AssetImage(search),
                        color: secondry,
                        size: 30.sp,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: ImageIcon(
                    const AssetImage(cart),
                    color: secondry,
                    size: 30.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.h,),
          Expanded(
            child: FutureBuilder(future: ApiManager.getAllProducts(), builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                debugPrint("${snapshot.error}");
                return const Center(child: Text("Something went wrong!"));
              }
              var products = snapshot.data?.products ?? [];
              return GridView.builder(
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductListItem(product: products[index],);
                },
              );
            },),
          )
        ],
      ),
    );
  }
}
