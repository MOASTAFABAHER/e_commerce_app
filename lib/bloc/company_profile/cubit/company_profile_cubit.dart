import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/models/responds/company_profile_respond.dart';
import 'package:e_commerce_app/service/dio_helper.dart';
import 'package:e_commerce_app/service/local/sp__keys.dart';
import 'package:e_commerce_app/service/local/sp_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'company_profile_state.dart';

class CompanyProfileCubit extends Cubit<CompanyProfileState> {
  CompanyProfileCubit() : super(CompanyProfileInitial());
  static CompanyProfileCubit get(context) => BlocProvider.of(context);
  CompanyProfileRespond companyProfileRespond = CompanyProfileRespond();
  getCompanyProfile() {
    emit(CompanyProfileLoadingState());
    DioHelper.getData(
            url: '/company-profile',
            token:
                SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token))
        .then((value) {
      companyProfileRespond = CompanyProfileRespond.fromJson(value.data);
      debugPrint("comapny suc");
      emit(CompanyProfileSuccsessState());
    }).catchError((error) {
      debugPrint("Error $error");
      emit(CompanyProfileErrorState());
    });
  }
}
