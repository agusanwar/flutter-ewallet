import 'package:aipay/models/data_provider_form_model.dart';
import 'package:aipay/services/transaction_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'data_provider_event.dart';
part 'data_provider_state.dart';

class DataProviderBloc extends Bloc<DataProviderEvent, DataProviderState> {
  DataProviderBloc() : super(DataProviderInitial()) {
    on<DataProviderEvent>((event, emit) async {
      // data paket provider
      if (event is DataProviderPost) {
        try {
          // loading
          emit(DataProviderLoading());

          // proses
          await TransactionServices().dataProvider(event.data);

          // success
          emit(DataProviderSuccess());
        } catch (e) {
          emit(DataProviderFailed(e.toString()));
        }
      }
    });
  }
}
