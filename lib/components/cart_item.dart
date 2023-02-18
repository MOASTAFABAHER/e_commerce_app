import 'package:e_commerce_app/bloc/favorite_cubit/cubit/favorite_cubit.dart';
import 'package:e_commerce_app/bloc/products_cubit/add_to_cart/cubit/add_to_cart_cubit.dart';
import 'package:e_commerce_app/components/custom_button.dart';
import 'package:e_commerce_app/components/custom_text.dart';
import 'package:e_commerce_app/config/toast_config.dart';
import 'package:e_commerce_app/enums/toast_status.dart';
import 'package:e_commerce_app/models/responds/poducts/prodcut_id_respond.dart';
import 'package:e_commerce_app/src/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  String? name, image;
  int? price, index, id;

  bool isWishListScreen;
  CartItem(
      {super.key,
      this.image,
      this.name,
      this.id,
      this.price,
      this.index,
      this.isWishListScreen = false});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddToCartCubit, AddToCartState>(
      listener: (context, state) {
        if (state is RemoveFromSucssesState) {
          ToastConfig.showToast(
              msg: "Removed", toastStates: ToastStates.Success);
        }
        if (state is RemoveFromCartErrorState) {
          ToastConfig.showToast(
              msg: "Removed", toastStates: ToastStates.Success);
        }
      },
      builder: (context, state) {
        var cubit = AddToCartCubit.get(context);
        return BlocConsumer<FavoriteCubit, FavoriteState>(
          listener: (context, state) {
            if (state is RemoveFavoriteSucssesState) {
              ToastConfig.showToast(
                  msg: "Removed", toastStates: ToastStates.Success);
            }
          },
          builder: (context, state) {
            var favoriteCubit = FavoriteCubit.get(context);
            return Container(
              height: 80.h,
              width: double.infinity,
              child: Row(
                children: [
                  Image.network(
                    'https://m.media-amazon.com/images/I/61UY5LzzA0L._AC_UF1000,1000_QL80_.jpg',
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(
                        text: name ?? "NuLL",
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomText(
                        text: "${price} EGP",
                        fontSize: 18.sp,
                        color: AppColors.kRedColor,
                      )
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: CustomButton(
                          function: () {
                            isWishListScreen
                                ? favoriteCubit.removeFavorite(id: id!)
                                : cubit.removeFromCart(index!);
                          },
                          textColor: AppColors.kWhiteColor,
                          fontWeight: FontWeight.bold,
                          colorContainer: AppColors.kRedColor,
                          radiusCircular: 0,
                          width: 100.w,
                          hight: 30.h,
                          text: "Remove !"),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
