import 'package:breaking_app/constants/my_colors.dart';
import 'package:breaking_app/data/models/characters.dart';
import 'package:breaking_app/data/models/episodes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EpisodeItem extends StatelessWidget {
  final Episode episode;
  const EpisodeItem({Key? key, required this.episode}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.myCoffee,
      ),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(4),
      width: double.infinity,
      child: InkWell(
        onTap: () {},
        // onTap: () => Navigator.pushNamed(context, characterDetailsScreen , arguments: character),
        child: GridTile(
          child: Container(
              color: MyColors.myCoffee,
              child: Image.asset(
                episode.img,
                width: double.infinity,
                fit: BoxFit.fill,
              )),
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black87,
            alignment: Alignment.bottomCenter,
            child: Text(
              episode.title,
              style: const TextStyle(
                height: 1.3,
                fontSize: 16,
                color: MyColors.myCoffee,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
