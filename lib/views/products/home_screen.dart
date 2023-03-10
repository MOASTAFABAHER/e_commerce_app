import 'package:e_commerce_app/bloc/Payment_cubit/cubit/k_y_c_cubit.dart';
import 'package:e_commerce_app/components/products/List_of_best_seller.dart';
import 'package:e_commerce_app/components/products/all_item_grid_view.dart';

import 'package:e_commerce_app/components/sldier_row/custom_row_slider.dart';
import 'package:e_commerce_app/models/responds/categories/topic_text.dart';

import 'package:e_commerce_app/src/app_colors.dart';
import 'package:e_commerce_app/utils/app_navigator.dart';
import 'package:e_commerce_app/views/products/cart_screen.dart';
import 'package:e_commerce_app/views/settings/List_of_categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/categories/get_all_categories_list.dart';
import '../../components/fields/custom_serch_filed.dart';
import '../../components/settings/list_drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => KYCCubit()..getAuthToken(),
      child: BlocConsumer<KYCCubit, KYCState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            key: scaffoldKey,
            drawer: ListDrawer(),
            backgroundColor: AppColors.kWhiteColor,
            appBar: AppBar(
              backgroundColor: AppColors.kWhiteColor,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  scaffoldKey.currentState?.openDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  size: 25.sp,
                  color: AppColors.kGreyColor,
                ),
              ),
              title: SizedBox(
                height: 75.h,
                child: CustomSearchField(
                  lable: 'Search',
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      AppNavigator.appNavigator(context, CartScreen(),
                          isFinished: true);
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: AppColors.kGreyColor,
                    )),
              ],
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const CustomRowSlider(),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        TopicText(
                          text: 'Categories',
                          function: () {
                            AppNavigator.appNavigator(
                                context, const ListOfCategoriesScreen(),
                                isFinished: true);
                          },
                        ),
                        const GetAllCategoriesList(),
                        TopicText(text: 'Best Seller'),
                        const ListOfBestSeller(),
                        SizedBox(
                          height: 10.h,
                        ),
                        TopicText(text: 'All Item'),
                        const AllItemGridView()
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
