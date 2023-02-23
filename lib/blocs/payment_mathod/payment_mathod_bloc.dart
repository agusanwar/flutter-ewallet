import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'payment_mathod_event.dart';
part 'payment_mathod_state.dart';

class PaymentMathodBloc extends Bloc<PaymentMathodEvent, PaymentMathodState> {
  PaymentMathodBloc() : super(PaymentMathodInitial()) {
    on<PaymentMathodEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
