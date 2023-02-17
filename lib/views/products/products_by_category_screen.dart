import 'package:e_commerce_app/bloc/auth_cubit/products/get_products_by_category/cubit/get_products_by_category_cubit.dart';
import 'package:e_commerce_app/bloc/categories_cubit/get_categories/cubit/get_categories_cubit.dart';
import 'package:e_commerce_app/components/categories/iem_all_categorie.dart';
import 'package:e_commerce_app/components/settings/custom_app_bar.dart';
import 'package:e_commerce_app/models/responds/categories/topic_text.dart';
import 'package:e_commerce_app/src/app_colors.dart';
import 'package:e_commerce_app/utils/app_navigator.dart';
import 'package:e_commerce_app/views/products/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsBtCategoryScreen extends StatelessWidget {
  int id;
  ProductsBtCategoryScreen({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              CustomAppBar(
                text: 'Products',
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 10.r),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      TopicText(text: 'All Products by category'),
                      SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: BlocProvider(
                          create: (context) => GetProductsByCategoryCubit()
                            ..getProductsByCategory(id: id),
                          child: BlocConsumer<GetProductsByCategoryCubit,
                              GetProductsByCategoryState>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              var cubit =
                                  GetProductsByCategoryCubit.get(context);
                              return state is GetProductsByCategoryLoadingState
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : GridView.builder(
                                      padding: const EdgeInsets.only(right: 20),
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      primary: false,
                                      itemCount: cubit
                                          .productsAccordingToCategoryRespond
                                          .data!
                                          .length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              childAspectRatio: 0.64,
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 12,
                                              mainAxisSpacing: 10),
                                      itemBuilder: (context, index) {
                                        var myData = cubit
                                            .productsAccordingToCategoryRespond
                                            .data?[index];
                                        return ItemAllCategorie(
                                          function: () {
                                            AppNavigator.appNavigator(context,
                                                ProductScreen(id: myData.id!),
                                                isFinished: true);
                                          },
                                          text: myData!.name!,
                                        );
                                      });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
