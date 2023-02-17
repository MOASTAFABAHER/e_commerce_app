import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/service/dio_helper.dart';
import 'package:e_commerce_app/service/local/sp__keys.dart';
import 'package:e_commerce_app/service/local/sp_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../models/responds/poducts/products_according_to_category_respond.dart';

part 'get_products_by_category_state.dart';

class GetProductsByCategoryCubit extends Cubit<GetProductsByCategoryState> {
  GetProductsByCategoryCubit() : super(GetProductsByCategoryInitial());
  static GetProductsByCategoryCubit get(context) => BlocProvider.of(context);
  ProductsAccordingToCategoryRespond productsAccordingToCategoryRespond =
      ProductsAccordingToCategoryRespond();
  getProductsByCategory({required int id}) {
    emit(GetProductsByCategoryLoadingState());
    DioHelper.getData(
            url: '/product?category=$id',
            token:
                SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token))
        .then((value) {
      productsAccordingToCategoryRespond =
          ProductsAccordingToCategoryRespond.fromJson(value.data);
      debugPrint("suc");
      emit(GetProductsByCategorySucssesState());
    }).catchError((error) {
      debugPrint("Error $error");
      emit(GetProductsByCategoryErrorState());
    });
  }
}
