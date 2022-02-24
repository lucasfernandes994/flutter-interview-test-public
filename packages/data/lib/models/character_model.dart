import 'location_model.dart';

class CharacterModel {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  LocationModel? origin;
  LocationModel? location;
  String? imageUrl;
  List<String>? episodesUrl;
  String? characterUrl;
  DateTime? created;

  CharacterModel({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.imageUrl,
    this.episodesUrl,
    this.characterUrl,
    this.created,
  });

  static CharacterModel fromJson(dynamic json) => CharacterModel(
        id: json['id'],
        name: json['name'],
        status: json['status']?.toString().toLowerCase(),
        species: json['species'],
        type: json['type'],
        gender: json['gender']?.toString().toLowerCase(),
        origin: json['origin'] != null ? LocationModel.fromJson(json['origin']) : null,
        location: json['location'] != null ? LocationModel.fromJson(json['location']) : null,
        imageUrl: json['image'],
        episodesUrl: json['episode']?.cast<String>(),
        characterUrl: json['url'],
        created: DateTime.tryParse(json['created']),
      );
}

class Status {
  static const String alive = 'alive';
  static const String dead = 'dead';
  static const String unknown = 'unknown';
}

class Gender {
  static const String female = 'female';
  static const String male = 'male';
  static const String genderless = 'genderless';
  static const String unknown = 'unknown';
}
