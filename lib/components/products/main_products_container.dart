import 'package:e_commerce_app/components/add_to_cart_button.dart';
import 'package:e_commerce_app/components/custom_button.dart';
import 'package:e_commerce_app/components/custom_text.dart';
import 'package:e_commerce_app/models/responds/poducts/products_according_to_category_respond.dart';
import 'package:e_commerce_app/src/app_colors.dart';
import 'package:flutter/material.dart';
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
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                    size: 22.sp,
                    color: AppColors.kGreyColor,
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
