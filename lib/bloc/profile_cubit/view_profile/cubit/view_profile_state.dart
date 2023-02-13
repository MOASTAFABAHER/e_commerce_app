part of 'view_profile_cubit.dart';

@immutable
abstract class ViewProfileState {}

class ViewProfileInitial extends ViewProfileState {}

class ViewProfileLoadingState extends ViewProfileState {}

class ViewProfileSucssesState extends ViewProfileState {}

class ViewProfileErrorState extends ViewProfileState {}
