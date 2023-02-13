import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/categories_cubit/get_categories/cubit/get_categories_cubit.dart';
import 'categories_comonent.dart';

class GetAllCategoriesList extends StatelessWidget {
  const GetAllCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: BlocProvider(
        create: (context) => GetCategoriesCubit()..getAllCategories(),
        child: BlocConsumer<GetCategoriesCubit, GetCategoriesState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = GetCategoriesCubit.get(context);
            return ListView.separated(
                shrinkWrap: false,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoriesCompoent(
                      text: cubit.getCategoriesRespond.data![index].name!);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 10.w,
                  );
                },
                itemCount: cubit.getCategoriesRespond.data?.length ?? 0);
          },
        ),
      ),
    );
  }
}
