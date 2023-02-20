import 'package:e_commerce_app/components/custom_button.dart';
import 'package:e_commerce_app/components/custom_text.dart';
import 'package:e_commerce_app/components/fields/custom_textform.dart';
import 'package:e_commerce_app/src/app_colors.dart';
import 'package:e_commerce_app/utils/app_navigator.dart';
import 'package:e_commerce_app/views/payment/toggle_screen.dart';
import 'package:e_commerce_app/views/products/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateOrderScreen extends StatelessWidget {
  TextEditingController fiirstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  CreateOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.kWhiteColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              AppNavigator.appNavigator(context, CartScreen());
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.kBlackColor,
            )),
        title: CustomText(
          text: "Create order".toUpperCase(),
          color: AppColors.kBlueColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Please complete your information to complete your order",
                fontSize: 25.sp,
              ),
              CustomTextForm(
                  lable: 'first name',
                  controller: fiirstNameController,
                  icon: Icons.abc),
              CustomTextForm(
                  lable: 'last name',
                  controller: lastNameController,
                  icon: Icons.abc),
              CustomTextForm(
                  lable: 'Email', controller: emailController, icon: Icons.abc),
              CustomTextForm(
                  lable: 'Phone', controller: phoneController, icon: Icons.abc),
              CustomTextForm(
                  lable: 'Address',
                  controller: addressController,
                  icon: Icons.abc),
              CustomButton(
                function: () {
                  AppNavigator.appNavigator(
                      context,
                      ToggleScreen(
                          address: addressController.text,
                          email: emailController.text,
                          firstName: fiirstNameController.text,
                          lastName: lastNameController.text,
                          phone: phoneController.text),
                      isFinished: true);
                },
                colorContainer: AppColors.kBlueColor,
                radiusCircular: 4,
                width: double.infinity,
                hight: 40.h,
                text: "Create order",
                textColor: AppColors.kWhiteColor,
                fontSize: 20.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
