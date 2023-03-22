import 'package:aipay/models/tips_model.dart';
import 'package:aipay/services/tips_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tips_event.dart';
part 'tips_state.dart';

class TipsBloc extends Bloc<TipsEvent, TipsState> {
  TipsBloc() : super(TipsInitial()) {
    on<TipsEvent>((event, emit) async {
      // tips
      try {
        // Loading
        emit(TipsLoading());
        // prosess
        final tips = await TipsServices().getTips();

        // success
        emit(TipsSuccess(tips));
      } catch (e) {
        // failed
        emit(TipsFailed(e.toString()));
      }
    });
  }
}
