import 'package:aipay/models/transfer_form_model.dart';
import 'package:aipay/services/transaction_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'transfer_event.dart';
part 'transfer_state.dart';

class TransferBloc extends Bloc<TransferEvent, TransferState> {
  TransferBloc() : super(TransferInitial()) {
    on<TransferEvent>((event, emit) async {
      if (event is TransferPost) {
        try {
          // loading
          emit(TransferLoading());

          // prosess
          await TransactionServices().transfer(event.data);

          // succee
          emit(TransferSuccess());
        } catch (e) {
          // failed
          emit(TransferFailed(e.toString()));
        }
      }
    });
  }
}
