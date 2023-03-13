class DataProviderModel {
  final int? id;
  final String? name;
  final int? price;
  final int? operatorCardId;

  // constactor
  DataProviderModel({
    this.id,
    this.name,
    this.price,
    this.operatorCardId,
  });

  // get to json
  factory DataProviderModel.fromJson(Map<String, dynamic> json) =>
      DataProviderModel(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        operatorCardId: json['operator_card_id'],
      );
}
