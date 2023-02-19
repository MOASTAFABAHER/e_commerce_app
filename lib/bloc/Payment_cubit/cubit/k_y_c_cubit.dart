import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/service/local/sp_helper.dart';
import 'package:e_commerce_app/src/api_constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/auth_request_model.dart';
import '../../../service/local/sp__keys.dart';
import '../../../service/payment_helper.dart';

part 'k_y_c_state.dart';

class KYCCubit extends Cubit<KYCState> {
  KYCCubit() : super(KYCInitial());
  static KYCCubit get(context) => BlocProvider.of(context);
  AuthRequestModel? authTokenModel;
  Future<void> getAuthToken() async {
    emit(KYCLoadingState());
    Paymenthelper.postData(url: '/auth/tokens', data: {
      'api_key': ApiContest.paymentApiKey,
    }).then((value) {
      authTokenModel = AuthRequestModel.fromJson(value.data);
      ApiContest.paymentFirstToken = authTokenModel!.token;
      print('The token 🍅');
      emit(KYCSucssesState());
    }).catchError((error) {
      print('Error in auth token 🤦‍♂️');
      emit(
        KYCErrorState(),
      );
    });
  }
}
