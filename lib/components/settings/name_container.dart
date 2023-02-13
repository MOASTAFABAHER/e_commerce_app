import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/profile_cubit/view_profile/cubit/view_profile_cubit.dart';
import '../../src/app_colors.dart';
import '../custom_text.dart';

class NameContainer extends StatelessWidget {
  const NameContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewProfileCubit()..viewProfile(),
      child: BlocConsumer<ViewProfileCubit, ViewProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ViewProfileCubit.get(context).viewProfileResond;
          return state is ViewProfileLoadingState
              ? const Center(
                  child: CircularProgressIndicator(
                  color: AppColors.kWhiteColor,
                ))
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomText(
                      maxLines: 1,
                      text: cubit.data!.profile!.name!,
                      color: AppColors.kWhiteColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            CustomText(
                              text: 'Edit',
                              color: AppColors.kWhiteColor,
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            const Icon(
                              Icons.edit,
                              color: AppColors.kWhiteColor,
                            ),
                            SizedBox(
                              width: 70.w,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                );
        },
      ),
    );
  }
}
