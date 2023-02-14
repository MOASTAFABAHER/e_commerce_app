import 'package:e_commerce_app/components/custom_text.dart';
import 'package:e_commerce_app/models/settings_data.dart';
import 'package:e_commerce_app/src/app_colors.dart';
import 'package:e_commerce_app/utils/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainDrawerItem extends StatelessWidget {
  SettingsData settingsData;
  MainDrawerItem({required this.settingsData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.appNavigator(context, settingsData.widget,
            isFinished: true);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  settingsData.icon,
                  color: settingsData.isLast!
                      ? AppColors.kRedColor
                      : AppColors.kGreyColor.withOpacity(0.8),
                ),
                SizedBox(
                  width: 10.w,
                ),
                CustomText(
                  text: settingsData.name!,
                  fontSize: 20.sp,
                  color: settingsData.isLast!
                      ? AppColors.kRedColor
                      : AppColors.kBlackColor.withOpacity(0.8),
                )
              ],
            ),
            const Divider(
              color: AppColors.kGreyColor,
              thickness: 1,
            )
          ],
        ),
      ),
    );
  }
}
