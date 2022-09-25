part of 'episode_cubit.dart';

@immutable
abstract class EpisodeState {}

class EpisodeInitial extends EpisodeState {}

class EpisodeLoaded extends EpisodeState {
  final List<Episode> episodes;
  EpisodeLoaded(this.episodes);
}
