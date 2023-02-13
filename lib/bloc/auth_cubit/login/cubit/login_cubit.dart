import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../models/responds/auth/login_resonds.dart';
import '../../../../service/dio_helper.dart';
import '../../../../service/local/sp__keys.dart';
import '../../../../service/local/sp_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwrodController = TextEditingController();
  LoginResponds? loginResponds = LoginResponds();
  userLogin() {
    emit(LoginLoadingState());
    DioHelper.postData(url: '/login', data: {
      'email': emailController.text,
      'password': passwrodController.text
    }).then((value) {
      loginResponds = LoginResponds.fromJson(value.data);
      SharedPrefrenceHelper.saveData(
          key: SharedPreferencesKeys.token,
          value: loginResponds?.data?.accessToken);
      print(loginResponds?.data?.accessToken);

      print("Suc Login");
      emit(LoginSuccsessState());
    }).catchError((error) {
      emit(LoginErrorState());
      print('Error $error login');
    });
  }
}
