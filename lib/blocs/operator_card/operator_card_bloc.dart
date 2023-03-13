import 'package:aipay/models/operator_card_model.dart';
import 'package:aipay/services/provider_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'operator_card_event.dart';
part 'operator_card_state.dart';

class OperatorCardBloc extends Bloc<OperatorCardEvent, OperatorCardState> {
  OperatorCardBloc() : super(OperatorCardInitial()) {
    on<OperatorCardEvent>((event, emit) async {
      // operator card
      if (event is OperatorCardGet) {
        try {
          // loading
          emit(OperatorCardLoading());

          // prosess
          final operatorCards = await ProviderServices().getOperatorCards();

          // success
          emit(OperatorCardSuccess(operatorCards));
        } catch (e) {
          // failed
          emit(OperatorCardFailed(e.toString()));
        }
      }
    });
  }
}
