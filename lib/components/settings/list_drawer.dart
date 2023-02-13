import 'package:e_commerce_app/bloc/profile_cubit/view_profile/cubit/view_profile_cubit.dart';
import 'package:e_commerce_app/components/custom_text.dart';
import 'package:e_commerce_app/components/settings/main_drawer_item.dart';
import 'package:e_commerce_app/models/settings_data.dart';
import 'package:e_commerce_app/src/app_colors.dart';
import 'package:e_commerce_app/utils/app_navigator.dart';
import 'package:e_commerce_app/views/products/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'name_container.dart';

class ListDrawer extends StatelessWidget {
  ListDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Stack(
      children: [
        Container(
          height: 200.h,
          width: double.infinity,
          color: AppColors.kBlueColor,
        ),
        Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    AppNavigator.appNavigator(context, HomeScreen(),
                        isFinished: true);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.kWhiteColor,
                    size: 20.sp,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                      color: AppColors.kWhiteColor,
                      borderRadius: BorderRadius.circular(90.r)),
                  child: Icon(
                    Icons.person,
                    size: 30.sp,
                    color: AppColors.kGreyColor,
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                const NameContainer(),
              ],
            ),
            SizedBox(
              height: 500.h,
              child: ListView.builder(
                  shrinkWrap: false,
                  itemBuilder: (context, index) {
                    return MainDrawerItem(settingsData: myData[index]);
                  },
                  itemCount: myData.length),
            )
          ],
        )
      ],
    ));
  }
}
