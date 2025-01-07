import 'package:bloc_cubit_test/business_logic/cubit/characters_cubit.dart';
import 'package:bloc_cubit_test/core/strings.dart';
import 'package:bloc_cubit_test/data/models/characters.dart';
import 'package:bloc_cubit_test/data/repository/characters_repository.dart';
import 'package:bloc_cubit_test/data/web_services/characters_web_services.dart';
import 'package:bloc_cubit_test/presentaion/screens/characterce_screen.dart';
import 'package:bloc_cubit_test/presentaion/screens/characters_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;
  late QuoteCubit quoteCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
    quoteCubit = QuoteCubit(charactersRepository);
  }

  Route? generaterouter(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: CharacterceScreen(),
          ),
        );
      case charactersDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => QuoteCubit(charactersRepository),
                  child: CharactersDetailsScreen(
                    character: character,
                  ),
                ));
    }
    return null;
  }
}
