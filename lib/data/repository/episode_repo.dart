import 'package:breaking_app/data/models/episodes.dart';
import 'package:breaking_app/data/web_services/episode_web_services.dart';

class EpisodeRepo {
  Future<List<Episode>> getAllEpisodes() async {
    final episodes = await EpisodeWebServices().getAllEpisodes();
    return episodes.map((episode) => Episode.fromJson(episode)).toList();
  }
}
