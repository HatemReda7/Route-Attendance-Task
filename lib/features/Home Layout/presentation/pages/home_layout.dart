import 'package:attendance_task_route/features/Home%20Layout/data/data_sources/home_tab_remote.dart';
import 'package:attendance_task_route/features/Home%20Layout/presentation/manager/home_tab_cubit.dart';
import 'package:attendance_task_route/features/Home%20Layout/presentation/widgets/blue_route.dart';
import 'package:attendance_task_route/features/Home%20Layout/presentation/widgets/product_list.dart';
import 'package:attendance_task_route/features/Home%20Layout/presentation/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../manager/home_tab_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeTabCubit(HomeTabRemote())..getAllProducts(),
      child: BlocConsumer<HomeTabCubit, HomeTabState>(
        listener: (context, state) {
          if (state is HomeLoadingState) {
            const Center(child: CircularProgressIndicator());
            debugPrint('loading...');
          }
          if (state is HomeErrorState) {
            debugPrint('error...');
            const Center(child: Text("Something went wrong!"));
          }
          if (state is HomeSuccessState) {
            debugPrint('working...');
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BlueRouteIcon(),
                    SizedBox(
                      height: 15.h,
                    ),
                    const SearchBarItem(),
                    SizedBox(
                      height: 5.h,
                    ),
                    ProductList(allProducts: HomeTabCubit.get(context).products),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
