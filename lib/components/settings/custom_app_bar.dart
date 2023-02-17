import 'package:e_commerce_app/components/custom_text.dart';
import 'package:e_commerce_app/src/app_colors.dart';
import 'package:e_commerce_app/utils/app_navigator.dart';
import 'package:e_commerce_app/views/products/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  String text;
  CustomAppBar({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kWhiteColor,
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                AppNavigator.appNavigator(context, HomeScreen(),
                    isFinished: true);
              },
              icon: const Icon(Icons.arrow_back)),
          const Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CustomText(
              text: text,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: AppColors.kGreyColor,
              )),
        ],
      ),
    );
  }
}
