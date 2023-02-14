import 'package:e_commerce_app/components/settings/custom_app_bar.dart';
import 'package:e_commerce_app/models/responds/categories/topic_text.dart';
import 'package:e_commerce_app/src/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListOfCategoriesScreen extends StatelessWidget {
  const ListOfCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              text: 'Categories',
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 10.r),
              child: Column(
                children: [TopicText(text: 'All Categories')],
              ),
            )
          ],
        ),
      ),
    );
  }
}
