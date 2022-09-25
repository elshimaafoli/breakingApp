import 'package:bloc/bloc.dart';
import 'package:breaking_app/data/models/episodes.dart';
import 'package:breaking_app/data/repository/episode_repo.dart';
import 'package:meta/meta.dart';
part 'episode_state.dart';

class EpisodeCubit extends Cubit<EpisodeState> {
  EpisodeRepo episodeRepo;
  List<Episode> episodes = [];
  EpisodeCubit(this.episodeRepo) : super(EpisodeInitial());

  List<Episode> getAllEpisodes() {
    episodeRepo.getAllEpisodes().then((episodes) {
      emit(EpisodeLoaded(episodes));
      this.episodes = episodes;
    });
    return episodes;
  }
}
