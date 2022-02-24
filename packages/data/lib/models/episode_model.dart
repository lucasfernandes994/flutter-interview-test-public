class EpisodeModel {
  int? id;
  String? name;
  String? airDate;
  String? episode;
  List<String>? charactersUrl;
  String? episodeUrl;
  DateTime? created;

  EpisodeModel({
    this.id,
    this.name,
    this.airDate,
    this.episode,
    this.charactersUrl,
    this.episodeUrl,
    this.created,
  });

  static EpisodeModel fromJson(dynamic json) => EpisodeModel(
    id: json['id'],
    name: json['name'],
    airDate: json['air_date'],
    episode: json['episode'],
    charactersUrl: json['characters']?.cast<String>(),
    episodeUrl: json['url'],
    created: DateTime.tryParse(json['created']),
  );
}
