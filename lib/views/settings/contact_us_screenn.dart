import 'package:e_commerce_app/bloc/company_profile/cubit/company_profile_cubit.dart';
import 'package:e_commerce_app/components/fields/custom_serch_filed.dart';
import 'package:e_commerce_app/components/settings/contact_us_item.dart';
import 'package:e_commerce_app/components/settings/custom_app_bar.dart';
import 'package:e_commerce_app/models/responds/categories/topic_text.dart';
import 'package:e_commerce_app/src/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => CompanyProfileCubit()..getCompanyProfile(),
          child: BlocConsumer<CompanyProfileCubit, CompanyProfileState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = CompanyProfileCubit.get(context);
              return state is CompanyProfileLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(
                          color: AppColors.kBlueColor),
                    )
                  : SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            CustomAppBar(text: 'Contact Us'),
                            SizedBox(
                              height: 20.h,
                            ),
                            ContactusItem(
                                icon: Icons.abc,
                                mainText:
                                    cubit.companyProfileRespond.data![0].name!,
                                subText: "name"),
                            Divider(
                              thickness: 0.5,
                              color: AppColors.kGreyColor.withOpacity(0.8),
                              endIndent: 40,
                              indent: 40,
                            ),
                            ContactusItem(
                                icon: Icons.email,
                                mainText:
                                    cubit.companyProfileRespond.data![0].email!,
                                subText: "email"),
                            Divider(
                              thickness: 0.5,
                              color: AppColors.kGreyColor.withOpacity(0.8),
                              endIndent: 40,
                              indent: 40,
                            ),
                            ContactusItem(
                                icon: Icons.phone,
                                mainText:
                                    cubit.companyProfileRespond.data![0].phone!,
                                subText: "Phone"),
                            SizedBox(
                              height: 20.h,
                            ),
                            TopicText(text: 'Send Message'),
                            CustomSearchField(
                              lable: 'name',
                              isContact: true,
                            ),
                            CustomSearchField(
                              lable: 'Email',
                              isContact: true,
                            ),
                            CustomSearchField(
                              lable: 'Massage',
                              isContact: true,
                              maxLine: 9,
                              minLine: 6,
                            ),
                          ],
                        ),
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
