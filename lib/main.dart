import 'package:e_commerce_app/service/dio_helper.dart';
import 'package:e_commerce_app/service/local/sp__keys.dart';
import 'package:e_commerce_app/service/local/sp_helper.dart';
import 'package:e_commerce_app/service/payment_helper.dart';
import 'package:e_commerce_app/src/app_root.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Paymenthelper.init();
  DioHelper.init();
  SharedPrefrenceHelper.init();

  debugPrint(SharedPrefrenceHelper.getData(key: 'isFirst'));
  runApp(const AppRoot());
}
