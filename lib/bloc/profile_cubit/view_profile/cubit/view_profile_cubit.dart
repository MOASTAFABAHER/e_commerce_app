import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/models/responds/profile/view_profile_respond.dart';
import 'package:e_commerce_app/service/dio_helper.dart';
import 'package:e_commerce_app/service/local/sp__keys.dart';
import 'package:e_commerce_app/service/local/sp_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'view_profile_state.dart';

class ViewProfileCubit extends Cubit<ViewProfileState> {
  ViewProfileCubit() : super(ViewProfileInitial());
  static ViewProfileCubit get(context) => BlocProvider.of(context);
  ViewProfileResond viewProfileResond = ViewProfileResond();
  viewProfile() {
    emit(ViewProfileLoadingState());
    DioHelper.getData(
            url: '/profile',
            token:
                SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token))
        .then((value) {
      viewProfileResond = ViewProfileResond.fromJson(value.data);
      emit(ViewProfileSucssesState());
    }).catchError((error) {
      print("Error Profile $error");
      emit(ViewProfileErrorState());
    });
  }
}
