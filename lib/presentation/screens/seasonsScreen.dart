import 'package:breaking_app/business_logic/cubit/episode_cubit.dart';
import 'package:breaking_app/constants/my_colors.dart';
import 'package:breaking_app/data/models/episodes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeasonsScreen extends StatefulWidget {
  @override
  State<SeasonsScreen> createState() => _SeasonsScreenState();
}

class _SeasonsScreenState extends State<SeasonsScreen> {
  late List<Episode> allEpisode;
  final List<String> images = [
    'assets/images/season1.jpg',
    'assets/images/season2.jpg',
    'assets/images/season3.jpg',
    'assets/images/season4.jpg',
    'assets/images/season5.jpg'
  ];
  void initState() {
    super.initState();
    // wake up the blocProvider;
    BlocProvider.of<EpisodeCubit>(context).getAllEpisodes();
  }

  @override
  Widget build(BuildContext context) {
    //print(allEpisode.length);
    return Scaffold(
      appBar: AppBar(
        title: Text('Seasons'),
        backgroundColor: MyColors.myCoffee,
      ),
      body: buildBlocWidget(),
    );
  }

  Widget buildBlocWidget() {
    return BlocBuilder<EpisodeCubit, EpisodeState>(builder: (_, state) {
      if (state is EpisodeLoaded) {
        allEpisode = (state).episodes;
        // print(allEpisode.length);
        return buildLoadedListWidget();
      } else {
        return showLoadingIndicator();
      }
    });
  }

  Widget showLoadingIndicator() => const Center(
        child: CircularProgressIndicator(
          color: MyColors.myBrown,
          value: 30,
        ),
      );

  Widget buildLoadedListWidget() {
    return ListView.separated(
        itemBuilder: (context, index) => itemBuild(context, index),
        separatorBuilder: (context, index) => Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              width: double.infinity,
              height: 5,
              color: MyColors.myBrown,
            ),
        itemCount: 5);
  }

  Widget itemBuild(context, index) {
    return InkWell(
      onTap: () {
        var filteredList = allEpisode
            .where((element) => int.parse(element.season) == index + 1)
            .toList();
        for (var e in filteredList) {
          e.img = images[index];
        }
        print(allEpisode.length);
        Navigator.pushNamed(context, 'episodesSeasonList',
            arguments: filteredList);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                clipBehavior: Clip.antiAlias,
                height: 220,
                width: 180,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: Image.asset(
                  images[index],
                  fit: BoxFit.fill,
                )),
            Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Season${index + 1}',
                style: const TextStyle(
                  height: 1.3,
                  fontSize: 20,
                  color: MyColors.myBrown,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
