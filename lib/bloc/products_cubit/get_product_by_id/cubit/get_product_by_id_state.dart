part of 'get_product_by_id_cubit.dart';

@immutable
abstract class GetProductByIdState {}

class GetProductByIdInitial extends GetProductByIdState {}

class GetProductByLoadingState extends GetProductByIdState {}

class GetProductByErrorState extends GetProductByIdState {}

class GetProductBySucssesState extends GetProductByIdState {}
