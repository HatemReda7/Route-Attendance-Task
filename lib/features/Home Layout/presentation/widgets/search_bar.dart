import 'package:attendance_task_route/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';

class SearchBarItem extends StatelessWidget {
  const SearchBarItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 50.h,
          width: 300.w,
          child: SearchBar(
            backgroundColor: const MaterialStatePropertyAll(Colors.white),
            elevation: const MaterialStatePropertyAll(0),
            leading: ImageIcon(
              const AssetImage(search),
              color: secondry,
              size: 30.sp,
            ),
            textStyle: MaterialStatePropertyAll(description.copyWith(color: secondry,decorationThickness: 0)),
            side: MaterialStatePropertyAll(
                BorderSide(color: secondry, width: 2.w)),
            hintText: "What do you want to search for?",
            hintStyle: MaterialStatePropertyAll(searchText),
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
    );
  }
}
