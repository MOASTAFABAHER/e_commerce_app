import 'package:e_commerce_app/bloc/favorite_cubit/cubit/favorite_cubit.dart';
import 'package:e_commerce_app/bloc/favorite_cubit/is_favorite_cubit/cubit/is_favorite_check_cubit.dart';
import 'package:e_commerce_app/bloc/products_cubit/get_product_by_id/cubit/get_product_by_id_cubit.dart';
import 'package:e_commerce_app/components/add_to_cart_button.dart';
import 'package:e_commerce_app/components/custom_button.dart';
import 'package:e_commerce_app/components/custom_text.dart';
import 'package:e_commerce_app/components/settings/custom_app_bar.dart';
import 'package:e_commerce_app/models/responds/poducts/products_according_to_category_respond.dart';
import 'package:e_commerce_app/src/app_colors.dart';
import 'package:e_commerce_app/utils/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/toast_config.dart';
import '../../enums/toast_status.dart';

class ProductScreen extends StatefulWidget {
  int id;
  ProductScreen({required this.id});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: SafeArea(
          child: BlocProvider(
        create: (context) => GetProductByIdCubit()..getProduct(id: widget.id),
        child: BlocConsumer<GetProductByIdCubit, GetProductByIdState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = GetProductByIdCubit.get(context);
            var myData = cubit.productIdRespond.data;
            return state is GetProductByLoadingState
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.kBlueColor,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomAppBar(text: cubit.productIdRespond.data!.name!),
                        Image.network(
                            'https://www.notebookcheck.net/fileadmin/Notebooks/News/_nc3/photo_1517336714731_489689fd1ca8_9.jpeg'),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: cubit.productIdRespond.data!.name!,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            BlocConsumer<FavoriteCubit, FavoriteState>(
                              listener: (context, state) {
                                if (state is AddFavoriteAllReadyAddedState) {
                                  ToastConfig.showToast(
                                      msg: "Allready Added",
                                      toastStates: ToastStates.Warning);
                                }
                                if (state is AddFavoriteSucssesState) {
                                  ToastConfig.showToast(
                                      msg: "Added",
                                      toastStates: ToastStates.Success);
                                }
                                if (state is AddFavoriteErrorState) {
                                  ToastConfig.showToast(
                                      msg: "Error",
                                      toastStates: ToastStates.Error);
                                }
                              },
                              builder: (context, state) {
                                var cubitFavorite = FavoriteCubit.get(context);
                                return BlocProvider(
                                  create: (context) => IsFavoriteCheckCubit()
                                    ..isFavoriteCheck(
                                      favoriteList: cubitFavorite.favoriteList,
                                      id: widget.id,
                                    ),
                                  child: BlocConsumer<IsFavoriteCheckCubit,
                                      IsFavoriteCheckState>(
                                    listener: (context, state) {
                                      // TODO: implement listener
                                    },
                                    builder: (context, state) {
                                      var check =
                                          IsFavoriteCheckCubit.get(context);
                                      return IconButton(
                                          onPressed: () {
                                            if (check.isFavorite) {
                                              cubitFavorite.removeFavorite(
                                                  id: myData!.id!);
                                              check.isFavorite = false;
                                            } else {
                                              cubitFavorite
                                                  .addToFavorite(Product(
                                                name: myData!.name,
                                                id: myData.id,
                                                price: myData.price,
                                              ));
                                              check.isFavoriteCheck(
                                                  id: myData.id!,
                                                  favoriteList: cubitFavorite
                                                      .favoriteList);
                                            }
                                          },
                                          icon: Icon(
                                            Icons.favorite,
                                            color: check.isFavorite
                                                ? AppColors.kRedColor
                                                : AppColors.kGreyColor,
                                          ));
                                    },
                                  ),
                                );
                              },
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            CustomText(
                              text:
                                  '${cubit.productIdRespond.data!.price!} EGP',
                              fontSize: 20.sp,
                              color: AppColors.kRedColor,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomText(
                          text:
                              'A laptop computer, sometimes called a notebook computer by manufacturers, is a battery- or AC-powered personal computer generally smaller than a briefcase that can easily be transported and conveniently used in temporary spaces such as on airplanes, in libraries, temporary offices, and at meetings.',
                          fontSize: 18.sp,
                        ),
                        const Spacer(flex: 1),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: AddToCardButton(
                            product: Product(
                              price: myData!.price,
                              name: myData.name,
                              id: widget.id,
                            ),
                            hight: 40.h,
                            width: 120.w,
                            radiusCircular: 0,
                          ),
                        ),
                      ],
                    ),
                  );
          },
        ),
      )),
    );
  }
}
