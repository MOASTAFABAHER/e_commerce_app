import 'package:e_commerce_app/bloc/profile_cubit/about_us_info/cubit/about_us_info_cubit.dart';
import 'package:e_commerce_app/components/custom_text.dart';
import 'package:e_commerce_app/components/settings/custom_app_bar.dart';
import 'package:e_commerce_app/src/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutUsScreen extends StatelessWidget {
  AboutUsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              text: 'About us',
            ),
            BlocProvider(
              create: (context) => AboutUsInfoCubit()..getAboutUsInfo(),
              child: BlocConsumer<AboutUsInfoCubit, AboutUsInfoState>(
                listener: (context, state) {},
                builder: (context, state) {
                  var cubitData = AboutUsInfoCubit.get(context).aboutUsRespond;
                  return state is AboutUsLoadingState
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.kBlueColor,
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.r,
                          ),
                          child: Material(
                            elevation: 6,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(140.r)),
                            child: Container(
                              padding: EdgeInsets.all(8.r),
                              height: 555.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(140.r))),
                              child: Column(
                                children: [
                                  Image.network(
                                      'https://img.freepik.com/premium-vector/global-network-connection_41981-1182.jpg'),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.r),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: CustomText(
                                        text: 'We are portatile company ',
                                        color: AppColors.kBlueColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20.sp,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: CustomText(
                                    maxLines: 10,
                                    fontSize: 25.sp,
                                    text: cubitData.data!.description!,
                                    color: AppColors.kGreyColor,
                                  ))
                                ],
                              ),
                            ),
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
