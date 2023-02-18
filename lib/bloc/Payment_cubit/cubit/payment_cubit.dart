import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/models/auth_request_model.dart';
import 'package:e_commerce_app/service/local/sp__keys.dart';
import 'package:e_commerce_app/service/local/sp_helper.dart';
import 'package:e_commerce_app/service/payment_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/order_register_model.dart';
import '../../../models/payment_request_model.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  static PaymentCubit get(context) => BlocProvider.of(context);
  Future getOrderRegistrationID({
    required String price,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
  }) async {
    emit(PaymentOrderLoadingState());
    Paymenthelper.postData(url: "/ecommerce/orders", data: {
      'auth_token': SharedPrefrenceHelper.getData(
          key: SharedPreferencesKeys.apiPaymentToken),
      "delivery_needed": "false",
      "amount_cents": 10,
      "currency": "EGP",
      "items": [],
    }).then((value) {
      OrderRegistrationModel orderRegistrationModel =
          OrderRegistrationModel.fromJson(value.data);
      SharedPrefrenceHelper.saveData(
          key: SharedPreferencesKeys.paymentOrderId,
          value: orderRegistrationModel.id.toString());
      getPaymentRequest(price, firstName, lastName, email, phone);
      print('The order id 🍅 =${SharedPrefrenceHelper.getData(
        key: SharedPreferencesKeys.paymentOrderId,
      )}');
      emit(PaymentLoadingState());
    }).catchError((error) {
      print('Error in order id 🤦‍♂️');
      emit(
        PaymentErrorState(),
      );
    });
  }

  Future<void> getPaymentRequest(
    String priceOrder,
    String firstName,
    String lastName,
    String email,
    String phone,
  ) async {
    emit(PaymentRequestLoadingState());
    Paymenthelper.postData(
      url: '/acceptance/payment_keys',
      data: {
        "auth_token": SharedPrefrenceHelper.getData(
            key: SharedPreferencesKeys.apiPaymentToken),
        "amount_cents": "EGP",
        "expiration": 3600,
        "order_id": SharedPrefrenceHelper.getData(
            key: SharedPreferencesKeys.paymentOrderId),
        "billing_data": {
          "apartment": "NA",
          "email": "mostafa@gmail.com",
          "floor": "NA",
          "first_name": "mostafa",
          "street": "NA",
          "building": "NA",
          "phone_number": '01000694166',
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": "baba",
          "state": "NA"
        },
        "currency": "EGP",
        "integration_id": '3384667',
        "lock_order_when_paid": "false"
      },
    ).then((value) {
      PaymentRequestModel paymentRequestModel =
          PaymentRequestModel.fromJson(value.data);
      SharedPrefrenceHelper.saveData(
          key: SharedPreferencesKeys.finalToken,
          value: paymentRequestModel.token);
      print('Final token 🚀 ${SharedPrefrenceHelper.getData(
        key: SharedPreferencesKeys.finalToken,
      )}');
      emit(PaymentRequestSucssesState());
    }).catchError((error) {
      print('Error in final token 🤦‍♂️');
      print('Error $error');
      emit(
        PaymentRequestErrorState(),
      );
    });
  }

  Future getRefCode() async {
    emit(PaymentRefCodeLoadingStates());
    Paymenthelper.postData(
      url: 'acceptance/payments/pay',
      data: {
        "source": {
          "identifier": "AGGREGATOR",
          "subtype": "AGGREGATOR",
        },
        "payment_token": SharedPrefrenceHelper.getData(
            key: SharedPrefrenceHelper.getData(
                key: SharedPreferencesKeys.finalToken)),
      },
    ).then((value) {
      SharedPrefrenceHelper.saveData(
          key: SharedPreferencesKeys.refCode,
          value: value.data['id'].toString());
      print('The ref code 🍅${SharedPrefrenceHelper.getData(
        key: SharedPreferencesKeys.refCode,
      )}');
      emit(PaymentRefCodeSucssesStates());
    }).catchError((error) {
      print("Error in ref code 🤦‍♂️");
      emit(PaymentRefCodeErrorStates());
    });
  }
}
