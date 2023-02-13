import 'package:e_commerce_app/src/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRowSlider extends StatelessWidget {
  const CustomRowSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCarouselSlider(
      height: 150.h,
      showSubBackground: false,
      unselectedDotHeight: 15.h,
      selectedDotHeight: 15.h,
      selectedDotColor: AppColors.kBlueColor,
      items: [
        CarouselItem(
            image: NetworkImage(
                'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone-13-finish-select-202207-6-1inch-blue_AV1_FMT_WHH?wid=1280&hei=492&fmt=p-jpg&qlt=80&.v=1656712844528')),
        CarouselItem(
            image: NetworkImage(
                'https://consumer.huawei.com/content/dam/huawei-cbg-site/common/mkt/plp/laptops/matebook-16s-list.jpg')),
        CarouselItem(
            image: NetworkImage(
                'https://assets.reedpopcdn.com/peripherals_ps5.png/BROK/resize/1200x1200%3E/format/jpg/quality/70/peripherals_ps5.png'))
      ],
    );
  }
}
