import 'package:bloc_cubit_test/business_logic/cubit/characters_cubit.dart';
import 'package:bloc_cubit_test/core/app_style/app_colors.dart';
import 'package:bloc_cubit_test/data/models/characters.dart';
import 'package:bloc_cubit_test/presentaion/widgets/characters_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterceScreen extends StatefulWidget {
  const CharacterceScreen({super.key});

  @override
  State<CharacterceScreen> createState() => _CharacterceScreenState();
}

class _CharacterceScreenState extends State<CharacterceScreen> {
  late List<Character> allCharacters;
  @override
  void initState() {
    super.initState();
    allCharacters = BlocProvider.of<CharactersCubit>(context).getAllCharacers();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = (state).characters.cast<Character>();
          return BuildLoadedListWidget();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.kYellowColor,
      ),
    );
  }

  Widget BuildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.kGreyColor,
        child: Column(
          children: [
            buildCharacterList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharacterList() {
    return GridView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: allCharacters.length,
      itemBuilder: (ctx, index) {
        return CharactersItem(character: allCharacters[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kYellowColor,
        title: Text(
          "Characters",
          style: TextStyle(
            color: AppColors.kWhaiteColor,
          ),
        ),
      ),
      body: buildBlocWidget(),
    );
  }
}
