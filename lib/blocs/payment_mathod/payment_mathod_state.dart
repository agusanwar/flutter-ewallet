part of 'payment_mathod_bloc.dart';

abstract class PaymentMathodState extends Equatable {
  const PaymentMathodState();

  @override
  List<Object> get props => [];
}

class PaymentMathodInitial extends PaymentMathodState {}

class PaymentMathodLoading extends PaymentMathodState {}

class PaymentMathodFailed extends PaymentMathodState {
  final String e;
  const PaymentMathodFailed(this.e);

  @override
  List<Object> get props => [e];
}

class PaymentMathodSuccess extends PaymentMathodState {
  final List<PaymentMethodModel> paymentMethods;
  const PaymentMathodSuccess(this.paymentMethods);

  @override
  List<Object> get props => [paymentMethods];
}
