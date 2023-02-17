import 'package:e_commerce_app/components/products/main_products_container.dart';
import 'package:e_commerce_app/src/app_colors.dart';
import 'package:e_commerce_app/utils/app_navigator.dart';
import 'package:e_commerce_app/views/products/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/products_cubit/cubit/get_all_products_cubit.dart';

class AllItemGridView extends StatelessWidget {
  const AllItemGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
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
              : SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: GridView.builder(
                      padding: const EdgeInsets.only(right: 20),
                      physics: const NeverScrollableScrollPhysics(),
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
                        var myData = cubit.getAllProductsRespond.data![index];
                        return MainProductsContainer(
                            product: cubit.getAllProductsRespond.data![index],
                            function: () {
                              AppNavigator.appNavigator(
                                  context, ProductScreen(id: myData.id!),
                                  isFinished: true);
                            },
                            id: myData.id!,
                            imageUrl: myData.image!,
                            name: myData.name!,
                            price: myData.price!);
                      }),
                );
        },
      ),
    );
  }
}
