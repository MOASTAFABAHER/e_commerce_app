import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/models/responds/categories/get_categories_responds.dart';
import 'package:e_commerce_app/service/dio_helper.dart';
import 'package:e_commerce_app/service/local/sp__keys.dart';
import 'package:e_commerce_app/service/local/sp_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  GetCategoriesCubit() : super(GetCategoriesInitial());
  static GetCategoriesCubit get(context) => BlocProvider.of(context);
  GetCategoriesRespond getCategoriesRespond = GetCategoriesRespond();

  getAllCategories() {
    emit(GetCategoriesLoadingState());
    DioHelper.getData(
      url: '/categories',
      token: SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token),
    ).then((value) {
      getCategoriesRespond = GetCategoriesRespond.fromJson(value.data);
      print(getCategoriesRespond);
      debugPrint('Suc');
      emit(GetCategoriesSucssesState());
    }).catchError((error) {
      debugPrint('Error =$error');
      emit(GetCategoriesErrorState());
    });
  }
}
