import 'package:e_commerce_app/service/local/sp__keys.dart';
import 'package:e_commerce_app/service/local/sp_helper.dart';
import 'package:e_commerce_app/views/auth/register_screen.dart';
import 'package:e_commerce_app/views/payment/toggle_screen.dart';
import 'package:e_commerce_app/views/products/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/auth_cubit/login/cubit/login_cubit.dart';
import '../../components/custom_button.dart';
import '../../components/custom_text.dart';
import '../../components/fields/custom_textform.dart';
import '../../components/logo_component.dart';
import '../../components/social/social_icons_component.dart';
import '../../config/toast_config.dart';
import '../../enums/toast_status.dart';
import '../../src/app_colors.dart';
import '../../utils/app_navigator.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccsessState) {
            ToastConfig.showToast(
                msg: 'Wellcome', toastStates: ToastStates.Success);
            AppNavigator.appNavigator(context, HomeScreen(), isFinished: true);
          }

          if (state is LoginErrorState) {
            ToastConfig.showToast(msg: 'Error', toastStates: ToastStates.Error);
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            backgroundColor: AppColors.kWhiteColor,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    LogoComponent(),
                    CustomText(
                      text: 'Welcome Back ',
                      color: AppColors.kBlueColor,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomText(
                      text: 'Please login to your account ',
                      fontWeight: FontWeight.w500,
                    ),
                    CustomTextForm(
                        lable: 'Email',
                        controller: cubit.emailController,
                        icon: Icons.email),
                    CustomTextForm(
                        isPassword: true,
                        lable: 'Password',
                        controller: cubit.passwrodController,
                        icon: Icons.lock),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: CustomText(
                          text: 'Forget Password',
                          color: AppColors.kBlackColor.withOpacity(1),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    CustomButton(
                      function: () {
                        cubit.userLogin();
                        SharedPrefrenceHelper.saveData(
                            key: SharedPreferencesKeys.isFirst, value: false);

                        print(SharedPrefrenceHelper.getData(
                            key: SharedPreferencesKeys.isFirst.toString()));
                      },
                      colorContainer: AppColors.kBlueColor,
                      radiusCircular: 0,
                      width: 310.w,
                      hight: 40.h,
                      fontSize: 20.sp,
                      text: 'Continue',
                      textColor: AppColors.kWhiteColor,
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    const SocialIconsComponent(),
                    SizedBox(
                      height: 37.h,
                    ),
                    CustomText(text: 'Don\'t have account?'),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomButton(
                      function: () {
                        AppNavigator.appNavigator(
                            context, const RegisterScreen(),
                            isFinished: true);
                      },
                      colorContainer: AppColors.kBlueColor,
                      radiusCircular: 0,
                      width: double.infinity,
                      hight: 40.h,
                      text: 'Sign up',
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.kWhiteColor,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
