import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:onboarding_animation/onboarding_animation.dart';

import '../../components/on_boarding/on_boarding_components.dart';
import '../../src/app_colors.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: OnBoardingAnimation(
          pages: [
            OnBoardingComponet(
              imagePath: 'assets/images/onboarding1.png',
              text:
                  '      Browse the menu \nand order dircetly from\n          the application',
            ),
            OnBoardingComponet(
              imagePath: 'assets/images/onboarding2.png',
              text:
                  '        Your order will be\n immediately collected and\n      send our courier',
            ),
            OnBoardingComponet(
              imagePath: 'assets/images/onboarding3.png',
              text:
                  '   Pick up delivery\n    at door and enjoy\n         groceries',
              isLast: true,
            ),
          ],
          indicatorDotHeight: 13,
          indicatorActiveDotColor: AppColors.kBlueColor,
          indicatorInActiveDotColor: AppColors.kGreyColor,
          indicatorDotWidth: 10,
          indicatorType: IndicatorType.worm,
          indicatorPosition: IndicatorPosition.bottomCenter,
        ),
      ),
    );
  }
}
