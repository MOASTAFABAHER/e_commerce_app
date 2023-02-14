import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/models/responds/profile/about_us_respond.dart';
import 'package:e_commerce_app/service/dio_helper.dart';
import 'package:e_commerce_app/service/local/sp__keys.dart';
import 'package:e_commerce_app/service/local/sp_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'about_us_info_state.dart';

class AboutUsInfoCubit extends Cubit<AboutUsInfoState> {
  AboutUsInfoCubit() : super(AboutUsInfoInitial());
  static AboutUsInfoCubit get(context) => BlocProvider.of(context);
  AboutUsRespond aboutUsRespond = AboutUsRespond();
  getAboutUsInfo() {
    emit(AboutUsLoadingState());
    DioHelper.getData(
            url: '/about-page',
            token:
                SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token))
        .then((value) {
      aboutUsRespond = AboutUsRespond.fromJson(value.data);
      debugPrint('Suc About us');
      emit(AboutUsSucssesState());
    }).catchError((error) {
      debugPrint('Error $error');
      emit(AboutUsErrorState());
    });
  }
}
