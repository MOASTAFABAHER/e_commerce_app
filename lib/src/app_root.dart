import 'package:e_commerce_app/bloc/favorite_cubit/cubit/favorite_cubit.dart';
import 'package:e_commerce_app/bloc/products_cubit/add_to_cart/cubit/add_to_cart_cubit.dart';
import 'package:e_commerce_app/service/local/sp__keys.dart';
import 'package:e_commerce_app/service/local/sp_helper.dart';
import 'package:e_commerce_app/views/auth/login_screen.dart';
import 'package:e_commerce_app/views/payment/toggle_screen.dart';
import 'package:e_commerce_app/views/products/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../views/on_boarding/on_boarding_screen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  ScreenUtilInit build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (buildContext) => AddToCartCubit()),
            BlocProvider(create: (buildContext) => FavoriteCubit())
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark,
                statusBarBrightness: Brightness.light,
              ),
            )),
            home: SharedPrefrenceHelper.getData(
                        key: SharedPreferencesKeys.isFirst.toString()) ==
                    false
                ? const LoginScreen()
                : const OnBoardingScreen(),
          ),
        );
      },
    );
  }
}
