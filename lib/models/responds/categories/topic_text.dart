import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/custom_text.dart';
import '../../../src/app_colors.dart';

class TopicText extends StatelessWidget {
  String text;
  var function;
  TopicText({super.key, required this.text, this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.r),
        child: Align(
          alignment: Alignment.centerLeft,
          child: CustomText(
            text: text,
            fontSize: 20.sp,
            color: AppColors.kBlueColor,
          ),
        ),
      ),
    );
  }
}
