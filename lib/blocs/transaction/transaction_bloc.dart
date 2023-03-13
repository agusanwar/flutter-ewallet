import 'package:aipay/models/transaction_model.dart';
import 'package:aipay/services/transaction_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionInitial()) {
    on<TransactionEvent>((event, emit) async {
      if (event is TransactionGet) {
        try {
          // loading
          emit(TransactionLoading());

          // prosess
          final transactions = await TransactionServices().getTransactions();

          // success
          emit(TransactionSuccess(transactions));
        } catch (e) {
          // failed
          emit(TransactionFailed(e.toString()));
        }
      }
    });
  }
}
