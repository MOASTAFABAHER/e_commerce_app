import 'package:e_commerce_app/bloc/favorite_cubit/cubit/favorite_cubit.dart';
import 'package:e_commerce_app/bloc/products_cubit/add_to_cart/cubit/add_to_cart_cubit.dart';
import 'package:e_commerce_app/components/cart_item.dart';
import 'package:e_commerce_app/components/custom_button.dart';
import 'package:e_commerce_app/components/custom_text.dart';
import 'package:e_commerce_app/components/settings/custom_app_bar.dart';
import 'package:e_commerce_app/src/app_colors.dart';
import 'package:e_commerce_app/utils/app_navigator.dart';
import 'package:e_commerce_app/views/products/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishListScreen extends StatelessWidget {
  int totalPrice = 0;
  WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: SafeArea(
        child: BlocConsumer<FavoriteCubit, FavoriteState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = FavoriteCubit.get(context);
            return cubit.favoriteList.length <= 1
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "No Item in you wish list ",
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        TextButton(
                            onPressed: () {
                              AppNavigator.appNavigator(context, HomeScreen(),
                                  isFinished: true);
                            },
                            child: const Text("Back"))
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CustomAppBar(
                          text: "Whis List ",
                          isCartScreen: true,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Expanded(
                          child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: false,
                              itemBuilder: (context, index) {
                                return CartItem(
                                  index: index,
                                  isWishListScreen: true,
                                  id: cubit.favoriteList[index + 1].id,
                                  name: cubit.favoriteList[index + 1].name,
                                  price: cubit.favoriteList[index + 1].price,
                                  image: cubit.favoriteList[index + 1].image,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Divider(
                                  thickness: 0.3,
                                  color: AppColors.kGreyColor,
                                );
                              },
                              itemCount: cubit.favoriteList.length - 1),
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
