import 'package:e_commerce_app/components/custom_text.dart';
import 'package:e_commerce_app/src/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactusItem extends StatelessWidget {
  IconData icon;
  String mainText, subText;

  ContactusItem(
      {super.key,
      required this.icon,
      required this.mainText,
      required this.subText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40.h,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: AppColors.kGreyColor.withOpacity(0.8),
            ),
            SizedBox(
              width: 20.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  fontSize: 18.sp,
                  text: mainText,
                  color: AppColors.kBlackColor,
                ),
                CustomText(text: subText)
              ],
            )
          ],
        ),
      ),
    );
  }
}
