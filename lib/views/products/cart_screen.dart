import 'package:e_commerce_app/bloc/products_cubit/add_to_cart/cubit/add_to_cart_cubit.dart';
import 'package:e_commerce_app/components/cart_item.dart';
import 'package:e_commerce_app/components/custom_button.dart';
import 'package:e_commerce_app/components/custom_text.dart';
import 'package:e_commerce_app/components/settings/custom_app_bar.dart';
import 'package:e_commerce_app/src/app_colors.dart';
import 'package:e_commerce_app/utils/app_navigator.dart';
import 'package:e_commerce_app/views/payment/toggle_screen.dart';
import 'package:e_commerce_app/views/products/create_order_screen.dart';
import 'package:e_commerce_app/views/products/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  int totalPrice = 0;
  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: SafeArea(
        child: BlocConsumer<AddToCartCubit, AddToCartState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AddToCartCubit.get(context);
            return cubit.pList!.length <= 1
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "No Item in cart",
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
                          text: "Cart",
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
                                totalPrice += cubit.pList![index + 1].price!;
                                print("hii");
                                return CartItem(
                                  index: index,
                                  name: cubit.pList![index + 1].name,
                                  price: cubit.pList![index + 1].price,
                                  image: cubit.pList![index + 1].image,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Divider(
                                  thickness: 0.3,
                                  color: AppColors.kGreyColor,
                                );
                              },
                              itemCount: cubit.pList!.length - 1),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: CustomText(
                                text: "Total Price is ${cubit.totalPrice} EGP",
                                color: AppColors.kRedColor,
                                fontSize: 18.sp,
                              ),
                            ),
                            CustomButton(
                                function: () {
                                  AppNavigator.appNavigator(
                                      context, CreateOrderScreen(),
                                      isFinished: true);
                                },
                                textColor: AppColors.kWhiteColor,
                                fontWeight: FontWeight.bold,
                                colorContainer: AppColors.kBlueColor,
                                radiusCircular: 6.r,
                                width: 80.w,
                                hight: 30.h,
                                text: "Checkout")
                          ],
                        )
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
