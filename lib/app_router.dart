import 'package:breaking_app/business_logic/cubit/character_cubit.dart';
import 'package:breaking_app/business_logic/cubit/episode_cubit.dart';
import 'package:breaking_app/data/models/characters.dart';
import 'package:breaking_app/data/models/episodes.dart';
import 'package:breaking_app/data/repository/character_repo.dart';
import 'package:breaking_app/data/repository/episode_repo.dart';
import 'package:breaking_app/data/web_services/character_web_services.dart';
import 'package:breaking_app/home_layout.dart';
import 'package:breaking_app/presentation/screens/character_details_screen.dart';
import 'package:breaking_app/presentation/screens/episodes_screen.dart';
import 'package:breaking_app/presentation/screens/login_screen.dart';
import 'package:breaking_app/presentation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
/* __instead of create objects inside createBuilder ,
 we create global objects in class scope and initialize it in constructor__
create: (BuildContext context) =>
                 CharacterCubit(CharacterRepo(CharacterWebServices())),*/

  late CharacterRepo characterRepo;
  late CharacterCubit characterCubit;

  AppRouter() {
    //? initialize for two members
    characterRepo = CharacterRepo(CharacterWebServices());
    characterCubit = CharacterCubit(characterRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case 'Login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case 'homelayout':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (BuildContext context) => characterCubit,
              ),
              BlocProvider(create: (context) => EpisodeCubit(EpisodeRepo())),
            ],
            child: HomeScreen(),
          ),
        );
      case 'episodesSeasonList':
        final edpisodes = settings.arguments as List<Episode>;
        return MaterialPageRoute(
            builder: (context) => EpisodesScreen(
                  episodesOfSeason: edpisodes,
                ));
      case 'CharacterDetails':
        final character = settings.arguments as Character;
        return MaterialPageRoute(
            builder: (_) => CharacterDetailScreen(
                  character: character,
                ));
    }
  }
}
