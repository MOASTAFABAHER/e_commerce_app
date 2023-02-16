import 'package:e_commerce_app/components/custom_text.dart';
import 'package:e_commerce_app/src/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemAllCategorie extends StatelessWidget {
  String text;
  ItemAllCategorie({required this.text});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      child: SizedBox(
        width: 200.w,
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            Image.network(
              'https://m.media-amazon.com/images/I/41vbmwe7e4L._SY450_.jpg',
            ),
            const Spacer(
              flex: 1,
            ),
            CustomText(
              fontSize: 20.sp,
              color: AppColors.kBlackColor,
              text: text,
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
