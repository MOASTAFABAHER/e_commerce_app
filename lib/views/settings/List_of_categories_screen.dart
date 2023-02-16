import 'package:e_commerce_app/bloc/categories_cubit/get_categories/cubit/get_categories_cubit.dart';
import 'package:e_commerce_app/bloc/products_cubit/cubit/get_all_products_cubit.dart';
import 'package:e_commerce_app/components/categories/iem_all_categorie.dart';
import 'package:e_commerce_app/components/settings/custom_app_bar.dart';
import 'package:e_commerce_app/models/responds/categories/topic_text.dart';
import 'package:e_commerce_app/src/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListOfCategoriesScreen extends StatelessWidget {
  const ListOfCategoriesScreen({super.key});

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
                text: 'Categories',
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 10.r),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      TopicText(text: 'All Categories'),
                      SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: BlocProvider(
                          create: (context) =>
                              GetCategoriesCubit()..getAllCategories(),
                          child: BlocConsumer<GetCategoriesCubit,
                              GetCategoriesState>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              var cubit = GetCategoriesCubit.get(context);
                              return state is GetCategoriesLoadingState
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : GridView.builder(
                                      padding: const EdgeInsets.only(right: 20),
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      primary: false,
                                      itemCount: 40,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              childAspectRatio: 0.64,
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 12,
                                              mainAxisSpacing: 10),
                                      itemBuilder: (context, index) {
                                        var myData = cubit
                                            .getCategoriesRespond.data?[index];
                                        return ItemAllCategorie(
                                          text: cubit.getCategoriesRespond
                                              .data![index].name!,
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
