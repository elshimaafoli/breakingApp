// To parse this JSON data, do
//
//     final episode = episodeFromJson(jsonString);

import 'dart:convert';

Episode episodeFromJson(String str) => Episode.fromJson(json.decode(str));

String episodeToJson(Episode data) => json.encode(data.toJson());

class Episode {
  Episode({
    required this.episodeId,
    required this.title,
    required this.season,
    required this.airDate,
    required this.characters,
    required this.episode,
    required this.series,
  }) {
    this.img = 'assets/images/BreakingBad.png';
  }

  String img = '';
  int episodeId;
  String title;
  String season;
  String airDate;
  List<String> characters;
  String episode;
  String series;

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        episodeId: json["episode_id"],
        title: json["title"],
        season: json["season"],
        airDate: json["air_date"],
        characters: List<String>.from(json["characters"].map((x) => x)),
        episode: json["episode"],
        series: json["series"],
      );

  Map<String, dynamic> toJson() => {
        "episode_id": episodeId,
        "title": title,
        "season": season,
        "air_date": airDate,
        "characters": List<dynamic>.from(characters.map((x) => x)),
        "episode": episode,
        "series": series,
      };
}
