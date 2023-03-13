import 'package:aipay/models/data_provider_model.dart';

class OperatorCardModel {
  final int? id;
  final String? name;
  final String? status;
  final String? thumbnail;
  final List<DataProviderModel>? dataProvider;

  // constactor
  OperatorCardModel({
    this.id,
    this.name,
    this.status,
    this.thumbnail,
    this.dataProvider,
  });

  // get to json
  factory OperatorCardModel.fromJson(Map<String, dynamic> json) =>
      OperatorCardModel(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        thumbnail: json['thumbnail'],
        dataProvider: json['data_plans'] == null
            ? null
            : (json['data_plans'] as List)
                .map((dataProvider) => DataProviderModel.fromJson(dataProvider))
                .toList(),
      );
}
