import 'package:e_commerce_app/service/local/sp_helper.dart';

class SharedPreferencesKeys {
  static const String baseUrl = 'https://accept.paymob.com/api';

  static const String token = 'Ures_token';
  static const String apiKeyPayment =
      'ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6VXhNaUo5LmV5SnVZVzFsSWpvaWFXNXBkR2xoYkNJc0ltTnNZWE56SWpvaVRXVnlZMmhoYm5RaUxDSndjbTltYVd4bFgzQnJJam8yT1RNMU16aDkuWFQtd2RyN3BmNjE0YUU1VjRhbXNrVHEwM3hsVExBaXpEZW5SdHdLb05KTXFMOFB2OFdranVoZ25nSUw5LTNCVzNsdDh4djEyT3B3MHNDQnZGMDRTSVE=';
  static String apiPaymentToken = 'api_payment_token';
  static String paymentOrderId = 'Payment_order_id';

  static const String integrationIdCard = '3384667';
  static const String integrationIdKiosk = 'ENTER_YOUR_INTEGRATION_ID';
  static String visaUrl =
      '$baseUrl/acceptance/iframes/424000?payment_token=${SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.finalToken)}';

  static String finalToken = 'Final_token';
  static String refCode = 'ref_code';

  static String isFirst = 'isFirst';
}
