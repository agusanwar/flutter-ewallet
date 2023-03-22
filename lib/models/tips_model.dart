class TipsModel {
  final int? id;
  final String? title;
  final String? url;
  final String? thumbnai;

  TipsModel({
    this.id,
    this.title,
    this.url,
    this.thumbnai,
  });

  // from json
  factory TipsModel.fromJson(Map<String, dynamic> json) => TipsModel(
        id: json['id'],
        title: json['titlle'],
        url: json['url'],
        thumbnai: json['thmbnail'],
      );
}
