import 'package:breaking_app/business_logic/cubit/character_cubit.dart';
import 'package:breaking_app/business_logic/cubit/episode_cubit.dart';
import 'package:breaking_app/constants/my_colors.dart';
import 'package:breaking_app/data/models/characters.dart';
import 'package:breaking_app/presentation/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);
  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacters;
  @override
  void initState() {
    super.initState();
    // wake up the blocProvider;
    BlocProvider.of<CharacterCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Characters'),
        backgroundColor: MyColors.myCoffee,
      ),
      body: buildBlocWidget(),
    );
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharacterCubit, CharacterState>(builder: (_, state) {
      if (state is CharacterLoaded) {
        allCharacters = (state).characters;
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
            itemCount: allCharacters.length,
            itemBuilder: (context, index) => CharacterItem(
                  character: allCharacters[index],
                )));
  }
}
