part of 'data_provider_bloc.dart';

abstract class DataProviderState extends Equatable {
  const DataProviderState();

  @override
  List<Object> get props => [];
}

class DataProviderInitial extends DataProviderState {}

class DataProviderLoading extends DataProviderState {}

class DataProviderFailed extends DataProviderState {
  final String e;
  const DataProviderFailed(this.e);

  @override
  List<Object> get props => [e];
}

class DataProviderSuccess extends DataProviderState {}
