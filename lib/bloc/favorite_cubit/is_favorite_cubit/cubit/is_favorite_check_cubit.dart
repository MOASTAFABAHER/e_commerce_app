import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:e_commerce_app/models/responds/poducts/products_according_to_category_respond.dart';

part 'is_favorite_check_state.dart';

class IsFavoriteCheckCubit extends Cubit<IsFavoriteCheckState> {
  IsFavoriteCheckCubit() : super(IsFavoriteCheckInitial());
  bool isFavorite = false;
  static IsFavoriteCheckCubit get(context) => BlocProvider.of(context);
  isFavoriteCheck({required int id, required List<Product> favoriteList}) {
    for (int i = 1; i < favoriteList.length; i++) {
      if (favoriteList[i].id == id) {
        isFavorite = true;
      } else {
        isFavorite = false;
      }
    }
  }
}
