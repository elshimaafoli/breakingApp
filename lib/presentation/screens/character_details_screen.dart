import 'package:breaking_app/constants/my_colors.dart';
import 'package:breaking_app/data/models/characters.dart';
import 'package:flutter/material.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Character character;
  const CharacterDetailScreen({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          character.name,
        ),
        backgroundColor: MyColors.myCoffee,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: character.charId,
                child: Container(
                  width: 200,
                  height: 300,
                  color: MyColors.myCoffee,
                  child: character.img.isNotEmpty
                      ? FadeInImage.assetNetwork(
                          placeholder: 'assets/images/loading.gif',
                          image: character.img,
                          fit: BoxFit.fill,
                        )
                      : Image.asset('assets/images/BreakingBad.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'NickName : ',
                      style: TextStyle(
                          fontSize: 20,
                          color: MyColors.myBrown,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      character.nickname,
                      style: TextStyle(
                          fontSize: 20,
                          color: MyColors.myBrown,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Real Name : ',
                      style: TextStyle(
                          fontSize: 20,
                          color: MyColors.myBrown,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      character.portrayed,
                      style: TextStyle(
                          fontSize: 20,
                          color: MyColors.myBrown,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'BirthDay : ',
                      style: TextStyle(
                          fontSize: 20,
                          color: MyColors.myBrown,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      character.birthday,
                      style: TextStyle(
                          fontSize: 20,
                          color: MyColors.myBrown,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
