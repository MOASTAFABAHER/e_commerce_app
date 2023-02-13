part of 'get_categories_cubit.dart';

@immutable
abstract class GetCategoriesState {}

class GetCategoriesInitial extends GetCategoriesState {}

class GetCategoriesLoadingState extends GetCategoriesState {}

class GetCategoriesErrorState extends GetCategoriesState {}

class GetCategoriesSucssesState extends GetCategoriesState {}
