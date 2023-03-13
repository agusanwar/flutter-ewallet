part of 'data_provider_bloc.dart';

abstract class DataProviderEvent extends Equatable {
  const DataProviderEvent();

  @override
  List<Object> get props => [];
}

class DataProviderPost extends DataProviderEvent {
  final DataProviderFormModel data;
  const DataProviderPost(this.data);

  @override
  List<Object> get props => [data];
}
