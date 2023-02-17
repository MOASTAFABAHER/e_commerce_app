part of 'get_products_by_category_cubit.dart';

@immutable
abstract class GetProductsByCategoryState {}

class GetProductsByCategoryInitial extends GetProductsByCategoryState {}

class GetProductsByCategoryLoadingState extends GetProductsByCategoryState {}

class GetProductsByCategoryErrorState extends GetProductsByCategoryState {}

class GetProductsByCategorySucssesState extends GetProductsByCategoryState {}
