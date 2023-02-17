import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/models/responds/poducts/prodcut_id_respond.dart';
import 'package:e_commerce_app/service/dio_helper.dart';
import 'package:e_commerce_app/service/local/sp__keys.dart';
import 'package:e_commerce_app/service/local/sp_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'get_product_by_id_state.dart';

class GetProductByIdCubit extends Cubit<GetProductByIdState> {
  GetProductByIdCubit() : super(GetProductByIdInitial());
  static GetProductByIdCubit get(context) => BlocProvider.of(context);
  ProductIdRespond productIdRespond = ProductIdRespond();
  getProduct({required int id}) {
    emit(GetProductByLoadingState());
    DioHelper.getData(
            url: '/products/$id',
            token:
                SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token))
        .then((value) {
      productIdRespond = ProductIdRespond.fromJson(value.data);
      emit(GetProductBySucssesState());
    }).catchError((error) {
      debugPrint("Error $error");
      emit(GetProductByErrorState());
    });
  }
}
