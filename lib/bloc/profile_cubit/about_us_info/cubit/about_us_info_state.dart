part of 'about_us_info_cubit.dart';

@immutable
abstract class AboutUsInfoState {}

class AboutUsInfoInitial extends AboutUsInfoState {}

class AboutUsErrorState extends AboutUsInfoState {}

class AboutUsLoadingState extends AboutUsInfoState {}

class AboutUsSucssesState extends AboutUsInfoState {}
