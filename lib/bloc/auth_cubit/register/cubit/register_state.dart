part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterSuccsessState extends RegisterState {}

class RegisterErrorState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}
