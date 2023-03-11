import 'package:aipay/models/payment_method_model.dart';
import 'package:aipay/services/payment_method_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'payment_mathod_event.dart';
part 'payment_mathod_state.dart';

class PaymentMathodBloc extends Bloc<PaymentMathodEvent, PaymentMathodState> {
  PaymentMathodBloc() : super(PaymentMathodInitial()) {
    on<PaymentMathodEvent>((event, emit) async {
      if (event is PaymentMethodGet) {
        try {
          // loading process
          emit(PaymentMathodLoading());

          //
          final paymentMethods =
              await PaymentMethodService().getPaymentMethods();

          emit(PaymentMathodSuccess(paymentMethods));
        } catch (e) {
          emit(PaymentMathodFailed(e.toString()));
        }
      }
    });
  }
}
