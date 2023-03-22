part of 'tips_bloc.dart';

abstract class TipsEvent extends Equatable {
  const TipsEvent();

  @override
  List<Object> get props => [];
}

class TipGet extends TipsEvent {}
