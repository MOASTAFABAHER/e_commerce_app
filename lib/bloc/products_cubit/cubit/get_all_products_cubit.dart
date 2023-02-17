import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/models/responds/poducts/get_all_products_respond.dart';
import 'package:e_commerce_app/service/dio_helper.dart';
import 'package:e_commerce_app/service/local/sp__keys.dart';
import 'package:e_commerce_app/service/local/sp_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'get_all_products_state.dart';

class GetAllProductsCubit extends Cubit<GetAllProductsState> {
  GetAllProductsCubit() : super(GetAllProductsInitial());
  static GetAllProductsCubit get(context) => BlocProvider.of(context);
  GetAllProductsRespond getAllProductsRespond = GetAllProductsRespond();
  getprodocts() {
    emit(GetAllProductsLoadingState());
    DioHelper.getData(
            url: '/products',
            token:
                SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token))
        .then((value) {
      getAllProductsRespond = GetAllProductsRespond.fromJson(value.data);

      print('Suc get ALl products');
      emit(GetAllProductsSucssessState());
    }).catchError((error) {
      debugPrint("Error $error");
      emit(GetAllProductsErrorState());
    });
  }
}
