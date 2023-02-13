part of 'payment_cubit.dart';

@immutable
abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentLoadingState extends PaymentState {}

class PaymentErrorState extends PaymentState {}

class PaymentSucssesState extends PaymentState {}

class PaymentOrderLoadingState extends PaymentState {}

class PaymentOrderSucssesState extends PaymentState {}

class PaymentOrderErrorState extends PaymentState {}

class PaymentRequestLoadingState extends PaymentState {}

class PaymentRequestSucssesState extends PaymentState {}

class PaymentRequestErrorState extends PaymentState {}

class PaymentRefCodeLoadingStates extends PaymentState {}

class PaymentRefCodeSucssesStates extends PaymentState {}

class PaymentRefCodeErrorStates extends PaymentState {}
