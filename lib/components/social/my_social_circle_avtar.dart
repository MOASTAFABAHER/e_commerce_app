import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../src/app_colors.dart';

class MySocialCircleAvtar extends StatelessWidget {
  String urlImage;
  var function;
  MySocialCircleAvtar({required this.urlImage, this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: CircleAvatar(
        backgroundColor: AppColors.kWhiteColor,
        radius: 20.r,
        backgroundImage: NetworkImage(urlImage),
      ),
    );
  }
}
