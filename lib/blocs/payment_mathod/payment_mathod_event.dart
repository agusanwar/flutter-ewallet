part of 'payment_mathod_bloc.dart';

abstract class PaymentMathodEvent extends Equatable {
  const PaymentMathodEvent();

  @override
  List<Object> get props => [];
}

class PaymentMethodGet extends PaymentMathodEvent {}
