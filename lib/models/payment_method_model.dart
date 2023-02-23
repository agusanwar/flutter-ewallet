class PaymentMethodModel {
  final String? id;
  final String? name;
  final String? code;
  final String? thumbnail;

  // constructor
  PaymentMethodModel({
    this.id,
    this.name,
    this.code,
    this.thumbnail,
  });

  // data from json
  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) =>
      PaymentMethodModel(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        thumbnail: json['thumbnail'],
      );
}
