import 'package:attendance_task_route/features/Home%20Layout/data/models/product_model.dart';
import 'package:attendance_task_route/features/Home%20Layout/domain/repositories/home_tab_repo.dart';
import 'package:attendance_task_route/features/Home%20Layout/presentation/manager/home_tab_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabCubit extends Cubit<HomeTabState>{
  HomeRepo repo;
  HomeTabCubit(this.repo) : super(HomeTabInitial());

  static HomeTabCubit get(context) => BlocProvider.of(context);
  List<Products> products = [];

  Future<void> getAllProducts() async {
    emit(HomeLoadingState());
    try {
      ProductModel data = await repo.getAllProducts();
      products = data.products ?? [];
      emit(HomeSuccessState());
    } catch (e) {
      emit(HomeErrorState());
      debugPrint(e.toString());
      rethrow;
    }
  }

}