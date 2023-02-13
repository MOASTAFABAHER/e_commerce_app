part of 'get_all_products_cubit.dart';

@immutable
abstract class GetAllProductsState {}

class GetAllProductsInitial extends GetAllProductsState {}

class GetAllProductsErrorState extends GetAllProductsState {}

class GetAllProductsLoadingState extends GetAllProductsState {}

class GetAllProductsSucssessState extends GetAllProductsState {}
