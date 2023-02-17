import 'package:e_commerce_app/components/custom_text.dart';
import 'package:e_commerce_app/src/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesCompoent extends StatelessWidget {
  String text;
  var function;
  CategoriesCompoent({required this.text, required this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: 140.w,
        height: 70.h,
        color: AppColors.kGreyColor.withOpacity(0.3),
        child: Column(
          children: [
            Image.network(
              'https://softlaptop.com/ecdata/stores/IYPUYD5769/image/cache/data/products/1646938408_Dell_G15_5511-500x500.jpg',
              height: 80.h,
            ),
            Expanded(
              child: CustomText(
                text: text,
                maxLines: 1,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
