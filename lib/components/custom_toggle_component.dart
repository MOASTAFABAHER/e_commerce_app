import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../src/app_colors.dart';
import 'custom_text.dart';

class CustomToggleComponent extends StatelessWidget {
  String text;
  String urlImage;
  var function;
  CustomToggleComponent(
      {required this.text, required this.urlImage, this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 200.h,
        width: 300.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: AppColors.kWhiteColor),
        child: Column(
          children: [
            Container(
              height: 200,
              child: Image.network(
                urlImage,
              ),
            ),
            CustomText(
              text: text,
              color: AppColors.kBlackColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            )
          ],
        ),
      ),
    );
  }
}
