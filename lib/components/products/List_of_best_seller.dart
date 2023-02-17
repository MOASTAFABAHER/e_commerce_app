import 'package:e_commerce_app/components/products/main_products_container.dart';
import 'package:e_commerce_app/src/app_colors.dart';
import 'package:e_commerce_app/utils/app_navigator.dart';
import 'package:e_commerce_app/views/products/product_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/products_cubit/cubit/get_all_products_cubit.dart';
import '../categories/categories_comonent.dart';

class ListOfBestSeller extends StatelessWidget {
  const ListOfBestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: BlocProvider(
        create: (context) => GetAllProductsCubit()..getprodocts(),
        child: BlocConsumer<GetAllProductsCubit, GetAllProductsState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = GetAllProductsCubit.get(context);
            return state is GetAllProductsLoadingState
                ? const Center(
                    child: CircularProgressIndicator(
                    color: AppColors.kBlueColor,
                  ))
                : ListView.separated(
                    shrinkWrap: false,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var mydata = cubit.getAllProductsRespond.data![index];
                      return MainProductsContainer(
                        id: mydata.id!,
                        imageUrl: mydata.image!,
                        name: mydata.name!,
                        price: mydata.price!,
                        function: () {
                          AppNavigator.appNavigator(
                            context,
                            ProductScreen(id: mydata.id!),
                            isFinished: true,
                          );
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 10.w,
                      );
                    },
                    itemCount: 5);
          },
        ),
      ),
    );
  }
}
