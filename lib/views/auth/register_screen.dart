import 'package:e_commerce_app/bloc/Payment/cubit/k_y_c_cubit.dart';
import 'package:e_commerce_app/views/auth/register_screen.dart';
import 'package:e_commerce_app/views/payment/toggle_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/auth/login/cubit/login_cubit.dart';
import '../../bloc/auth/register/cubit/register_cubit.dart';
import '../../components/custom_button.dart';
import '../../components/custom_text.dart';
import '../../components/custom_textform.dart';
import '../../components/logo_component.dart';
import '../../components/social_icons_component.dart';
import '../../config/toast_config.dart';
import '../../enums/toast_status.dart';
import '../../src/app_colors.dart';
import '../../utils/app_navigator.dart';
import '../test.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => KYCCubit(),
      child: BlocConsumer<KYCCubit, KYCState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.kWhiteColor,
            body: SafeArea(
                child: BlocProvider(
              create: (context) => RegisterCubit(),
              child: BlocConsumer<RegisterCubit, RegisterState>(
                listener: (context, state) {
                  if (state is RegisterSuccsessState) {
                    ToastConfig.showToast(
                        msg: 'Welcome', toastStates: ToastStates.Success);
                    AppNavigator.appNavigator(context, const ToggleScreen(),
                        isFinished: true);
                  }
                  if (state is RegisterErrorState) {
                    ToastConfig.showToast(
                        msg: 'Error', toastStates: ToastStates.Error);
                  }
                },
                builder: (context, state) {
                  var cubit = RegisterCubit.get(context);
                  return SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LogoComponent(),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomText(
                          text: 'Welcome to portatile',
                          color: AppColors.kBlueColor,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomText(
                          text: 'Please sign up to join us',
                          color: AppColors.kBlackColor,
                          fontSize: 20.sp,
                        ),
                        CustomTextForm(
                            lable: 'Name',
                            controller: cubit.nameController,
                            icon: Icons.person),
                        CustomTextForm(
                            lable: 'Email',
                            controller: cubit.emailController,
                            icon: Icons.email),
                        CustomTextForm(
                            isPassword: true,
                            lable: 'Password',
                            controller: cubit.passController,
                            icon: Icons.lock),
                        CustomButton(
                          colorContainer: AppColors.kBlueColor,
                          radiusCircular: 0,
                          width: 310.w,
                          hight: 40.h,
                          fontSize: 20.sp,
                          text: 'Continue',
                          textColor: AppColors.kWhiteColor,
                          function: () {
                            cubit.userRegister();
                            KYCCubit.get(context).getAuthToken();
                          },
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        const SocialIconsComponent(),
                        SizedBox(
                          height: 30.h,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: CustomText(
                            text: 'Already  have an account?',
                            color: AppColors.kGreyColor,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomButton(
                          function: () {
                            AppNavigator.appNavigator(
                                context, const LoginScreen(),
                                isFinished: true);
                          },
                          colorContainer: AppColors.kBlueColor,
                          radiusCircular: 0,
                          width: double.infinity,
                          hight: 40.h,
                          text: 'Login ',
                          textColor: AppColors.kWhiteColor,
                          fontSize: 20.sp,
                        )
                      ],
                    ),
                  );
                },
              ),
            )),
          );
        },
      ),
    );
  }
}
