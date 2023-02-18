import 'package:e_commerce_app/bloc/favorite_cubit/cubit/favorite_cubit.dart';
import 'package:e_commerce_app/bloc/favorite_cubit/is_favorite_cubit/cubit/is_favorite_check_cubit.dart';
import 'package:e_commerce_app/components/add_to_cart_button.dart';
import 'package:e_commerce_app/components/custom_button.dart';
import 'package:e_commerce_app/components/custom_text.dart';
import 'package:e_commerce_app/config/toast_config.dart';
import 'package:e_commerce_app/enums/toast_status.dart';
import 'package:e_commerce_app/models/responds/poducts/products_according_to_category_respond.dart';
import 'package:e_commerce_app/src/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainProductsContainer extends StatelessWidget {
  Product product;
  String imageUrl, name;
  int id, price;
  var function;
  MainProductsContainer(
      {required this.id,
      required this.product,
      required this.function,
      required this.imageUrl,
      required this.name,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Card(
        elevation: 2,
        child: Container(
          width: 170.w,
          color: AppColors.kWhiteColor.withOpacity(0.1),
          child: Stack(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 1,
                ),
                Image.network(
                  'https://consumer.huawei.com/content/dam/huawei-cbg-site/common/mkt/plp/laptops/matebook-16s-list.jpg',
                  height: 80.h,
                ),
                const Spacer(
                  flex: 1,
                ),
                CustomText(
                  text: name,
                  fontWeight: FontWeight.bold,
                ),
                CustomText(
                  text: '$price EGP',
                  color: AppColors.kRedColor,
                  fontSize: 14.sp,
                ),
                const Spacer(
                  flex: 1,
                ),
                AddToCardButton(
                  hight: 30.h,
                  radiusCircular: 5,
                  width: 130.w,
                  product: product,
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
            BlocConsumer<FavoriteCubit, FavoriteState>(
              listener: (context, state) {
                if (state is AddFavoriteAllReadyAddedState) {
                  ToastConfig.showToast(
                      msg: "Allready Added", toastStates: ToastStates.Warning);
                }
                if (state is AddFavoriteSucssesState) {
                  ToastConfig.showToast(
                      msg: "Added", toastStates: ToastStates.Success);
                }
                if (state is AddFavoriteErrorState) {
                  ToastConfig.showToast(
                      msg: "Error", toastStates: ToastStates.Error);
                }
              },
              builder: (context, state) {
                var cubit = FavoriteCubit.get(context);
                return BlocProvider(
                  create: (context) => IsFavoriteCheckCubit()
                    ..isFavoriteCheck(id: id, favoriteList: cubit.favoriteList),
                  child:
                      BlocConsumer<IsFavoriteCheckCubit, IsFavoriteCheckState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      var check = IsFavoriteCheckCubit.get(context);
                      return Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            onPressed: () {
                              if (check.isFavorite) {
                                cubit.removeFavorite(id: id);
                                check.isFavorite = false;
                              } else {
                                cubit.addToFavorite(product);
                                check.isFavoriteCheck(
                                    id: id, favoriteList: cubit.favoriteList);
                              }
                            },
                            icon: Icon(
                              Icons.favorite,
                              size: 22.sp,
                              color: check.isFavorite
                                  ? AppColors.kRedColor
                                  : AppColors.kGreyColor,
                            )),
                      );
                    },
                  ),
                );
              },
            )
          ]),
        ),
      ),
    );
  }
}
