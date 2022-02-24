class LocationModel {
  int? id;
  String? name;
  String? type;
  String? dimension;
  List<String>? residentsUrl;
  String? locationUrl;
  DateTime? created;

  LocationModel({
    this.id,
    this.name,
    this.type,
    this.dimension,
    this.residentsUrl,
    this.locationUrl,
    this.created,
  });

  static LocationModel fromJson(dynamic json) => LocationModel(
    id: json['id'],
    name: json['name'],
    type: json['type'],
    dimension: json['dimension'],
    residentsUrl: json['residents']?.cast<String>(),
    locationUrl: json['url'],
    created:
    json['created'] != null ? DateTime.tryParse(json['created']) : null,
  );
}
