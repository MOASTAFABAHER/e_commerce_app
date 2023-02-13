import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../src/app_colors.dart';

class CustomSearchField extends StatefulWidget {
  final String lable;

  final TextEditingController? controller;

  CustomSearchField({
    required this.lable,
    this.controller,
  });

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 22),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.kWhiteColor,
            borderRadius: BorderRadius.circular(25)),
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter ${widget.lable}';
            }
            return null;
          },
          controller: widget.controller,
          decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.kGreyColor)),
              labelStyle: const TextStyle(color: AppColors.kGreyColor),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.kGreyColor)),
              fillColor: AppColors.kWhiteColor,
              suffixIcon: Icon(
                Icons.search,
                color: AppColors.kGreyColor,
                size: 25.sp,
              ),
              border: UnderlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.kBlueColor),
                  borderRadius: BorderRadius.circular(25)),
              label: Text(
                '${widget.lable}',
              )),
        ),
      ),
    );
  }
}
