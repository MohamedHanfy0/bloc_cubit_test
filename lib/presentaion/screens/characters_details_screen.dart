import 'package:bloc_cubit_test/core/app_style/app_colors.dart';
import 'package:bloc_cubit_test/data/models/characters.dart';
import 'package:flutter/material.dart';

class CharactersDetailsScreen extends StatelessWidget {
  final Character character;
  const CharactersDetailsScreen({super.key, required this.character});

  Widget buildSliverAppBar() {
    return SliverAppBar(
        leading: BackButton(
          color: Colors.white,
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(AppColors.kGreyColor),
          ),
        ),
        expandedHeight: 600,
        pinned: true,
        stretch: true,
        backgroundColor: AppColors.kGreyColor,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(
            character.name,
            style: TextStyle(
              color: AppColors.kWhaiteColor,
            ),
            textAlign: TextAlign.center,
          ),
          background: Hero(
            tag: character.id,
            child: Image.network(
              character.images,
              fit: BoxFit.cover,
            ),
          ),
        ));
  }

  Widget buildInfoCharacters(String title, String value) {
    return RichText(
      // maxLines: 1,
      // overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: AppColors.kWhaiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: Colors.grey[500],
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buikDivider(double endIndent) {
    return Divider(
      color: AppColors.kYellowColor,
      height: 30,
      endIndent: endIndent,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kGreyColor,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          Container(
            child: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    margin: EdgeInsets.only(left: 14, top: 14, right: 14),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildInfoCharacters('Name : ', 'empty'),
                        buikDivider(350),
                        buildInfoCharacters(
                            'Nice Name : ', character.nameKanje),
                        buikDivider(300),
                        buildInfoCharacters(
                            'Favorites : ', character.favorites.toString()),
                        buikDivider(320),
                        buildInfoCharacters('About : ', character.about),
                        buikDivider(350),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
