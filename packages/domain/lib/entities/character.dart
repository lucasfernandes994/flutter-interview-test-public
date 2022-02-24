import 'location.dart';

class Character {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Location? origin;
  Location? location;
  String? imageUrl;
  List<String>? episodesUrl;
  String? characterUrl;
  DateTime? created;

  Character({
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
