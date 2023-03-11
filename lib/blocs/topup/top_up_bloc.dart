import 'package:aipay/models/topup_form_model.dart';
import 'package:aipay/services/transaction_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'top_up_event.dart';
part 'top_up_state.dart';

class TopUpBloc extends Bloc<TopUpEvent, TopUpState> {
  TopUpBloc() : super(TopUpInitial()) {
    on<TopUpEvent>((event, emit) async {
      // TopUp
      if (event is TopUpPost) {
        try {
          //loading
          emit(TopUpLoading());

          //prosess
          final redirectUrl = await TransactionServices().topUp(event.data);

          // success
          emit(TopUpSuccess(redirectUrl));
        } catch (e) {
          //failed
          emit(TopUpFailed(e.toString()));
        }
      }
    });
  }
}
