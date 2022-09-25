import 'package:breaking_app/constants/my_colors.dart';
import 'package:breaking_app/data/models/episodes.dart';
import 'package:breaking_app/presentation/widgets/episode_item.dart';
import 'package:flutter/material.dart';

class EpisodesScreen extends StatelessWidget {
  List<Episode> episodesOfSeason;
  EpisodesScreen({Key? key, required this.episodesOfSeason}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(episodesOfSeason.length);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myCoffee,
        title: const Text('Epsidoes'),
      ),
      body: buildLoadedListWidget(),
    );
  }

  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 2,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
            ),
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: episodesOfSeason.length,
            itemBuilder: (context, index) => EpisodeItem(
                  episode: episodesOfSeason[index],
                )));
  }
}
