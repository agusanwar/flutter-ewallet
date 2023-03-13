class TransactionTypeModel {
  final int? id;
  final String? name;
  final String? code;
  final String? thumbnail;

  TransactionTypeModel({
    this.id,
    this.name,
    this.code,
    this.thumbnail,
  });

  // Contructor User model dari json
  factory TransactionTypeModel.fromJson(Map<String, dynamic> json) =>
      TransactionTypeModel(
        id: json['id'],
        name: json['name'],
        code: json['code'],
        thumbnail: json['thumbnail'],
      );
}
