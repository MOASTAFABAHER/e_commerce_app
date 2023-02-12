import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../models/responds/register_responds.dart';
import '../../../../service/dio_helper.dart';
import '../../../../service/local/sp__keys.dart';
import '../../../../service/local/sp_helper.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  RegisterResponds? registerResponds;

  userRegister() {
    emit(RegisterLoadingState());
    DioHelper.postData(url: 'register', data: {
      'name': nameController.text,
      'email': emailController.text,
      'password': passController.text,
    }).then((value) {
      emit(RegisterSuccsessState());
      registerResponds = RegisterResponds.fromJson(value.data);
      SharedPrefrenceHelper.saveData(
          key: SharedPreferencesKeys.token,
          value: registerResponds!.data!.accessToken);
      print('Suc');
    }).catchError((error) {
      emit(RegisterErrorState());
      print('Error');
    });
  }
}
