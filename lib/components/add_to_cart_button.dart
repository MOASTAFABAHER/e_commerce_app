import 'package:e_commerce_app/bloc/products_cubit/add_to_cart/cubit/add_to_cart_cubit.dart';
import 'package:e_commerce_app/components/custom_button.dart';
import 'package:e_commerce_app/config/toast_config.dart';
import 'package:e_commerce_app/enums/toast_status.dart';
import 'package:e_commerce_app/models/responds/poducts/products_according_to_category_respond.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../src/app_colors.dart';

class AddToCardButton extends StatelessWidget {
  Product product;
  double width, hight, radiusCircular;
  AddToCardButton({
    required this.hight,
    required this.product,
    required this.radiusCircular,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddToCartCubit, AddToCartState>(
      listener: (context, state) {
        if (state is AddToCartErrorState) {
          ToastConfig.showToast(msg: "Error", toastStates: ToastStates.Error);
        }
        if (state is AddToCartSucssesState) {
          ToastConfig.showToast(msg: "Added", toastStates: ToastStates.Success);
        }
      },
      builder: (context, state) {
        var cubit = AddToCartCubit.get(context);
        return CustomButton(
          function: () async {
            if (product != null) {
              await cubit.addToCart(product: product);
            }
          },
          colorContainer: AppColors.kBlueColor,
          radiusCircular: radiusCircular,
          width: width,
          hight: hight,
          text: 'Add To Cart',
          textColor: AppColors.kWhiteColor,
        );
      },
    );
  }
}
