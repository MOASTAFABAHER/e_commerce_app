import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../src/app_colors.dart';
import '../../utils/app_navigator.dart';
import '../../views/auth/register_screen.dart';
import '../custom_button.dart';

class OnBoardingComponet extends StatelessWidget {
  bool isLast = false;
  String text;
  String imagePath;
  OnBoardingComponet(
      {required this.imagePath, this.isLast = false, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isLast
                  ? SizedBox()
                  : SizedBox(
                      height: 20.h,
                    ),
              Image.asset(
                '$imagePath',
                height: 400.h,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.r),
                  child: Text(
                    text,
                    style:
                        TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              isLast
                  ? CustomButton(
                      colorContainer: AppColors.kBlueColor,
                      radiusCircular: 10,
                      width: double.infinity,
                      hight: 40.h,
                      text: 'Get start',
                      textColor: AppColors.kWhiteColor,
                      function: () {
                        AppNavigator.appNavigator(context, RegisterScreen(),
                            isFinished: true);
                      },
                    )
                  : SizedBox(),
              SizedBox(
                height: 30.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
