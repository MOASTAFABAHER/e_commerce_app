import 'package:e_commerce_app/bloc/products_cubit/get_product_by_id/cubit/get_product_by_id_cubit.dart';
import 'package:e_commerce_app/components/custom_button.dart';
import 'package:e_commerce_app/components/custom_text.dart';
import 'package:e_commerce_app/components/settings/custom_app_bar.dart';
import 'package:e_commerce_app/src/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreen extends StatelessWidget {
  int id;
  ProductScreen({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: SafeArea(
          child: BlocProvider(
        create: (context) => GetProductByIdCubit()..getProduct(id: id),
        child: BlocConsumer<GetProductByIdCubit, GetProductByIdState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = GetProductByIdCubit.get(context);
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
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite,
                                  color: AppColors.kGreyColor,
                                )),
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
                          child: CustomButton(
                              colorContainer: AppColors.kBlueColor,
                              radiusCircular: 0,
                              width: 120.w,
                              hight: 40.h,
                              textColor: AppColors.kWhiteColor,
                              text: "Add TO Cart"),
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
