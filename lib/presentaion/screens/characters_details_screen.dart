import 'package:bloc_cubit_test/business_logic/cubit/characters_cubit.dart';
import 'package:bloc_cubit_test/core/app_style/app_colors.dart';
import 'package:bloc_cubit_test/data/models/characters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersDetailsScreen extends StatefulWidget {
  final Character character;
  const CharactersDetailsScreen({super.key, required this.character});

  @override
  State<CharactersDetailsScreen> createState() =>
      _CharactersDetailsScreenState();
}

class _CharactersDetailsScreenState extends State<CharactersDetailsScreen> {
  late List<Quote> allQuote;
  @override
  void initState() {
    super.initState();
    allQuote = BlocProvider.of<QuoteCubit>(context).getAllQuote();
  }

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
            widget.character.name,
            style: TextStyle(
              color: AppColors.kWhaiteColor,
            ),
            textAlign: TextAlign.center,
          ),
          background: Hero(
            tag: widget.character.id,
            child: Image.network(
              widget.character.images,
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

  Widget checkIfQuoteLoaded(CharactersState State) {
    if (State is QuoteLoaded) {
      return displayRandomQuoteOrEmptySpace(State);
    } else {
      return showProgressIndicator();
    }
  }

  Widget displayRandomQuoteOrEmptySpace(State) {
    var listQuote = (State).charQuote;
    return Center(
      child: Text(listQuote[0]),
    );
  }

  Widget showProgressIndicator() {
    return showProgressIndicator();
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
                        buildInfoCharacters('Name : ', widget.character.name),
                        buikDivider(350),
                        buildInfoCharacters(
                            'Nice Name : ', widget.character.nameKanje),
                        buikDivider(300),
                        buildInfoCharacters('Favorites : ',
                            widget.character.favorites.toString()),
                        buikDivider(320),
                        buildInfoCharacters('About : ', widget.character.about),
                        buikDivider(350),

                        SizedBox(
                          height: 20,
                        ),
                        BlocBuilder<QuoteCubit, CharactersState>(
                            builder: (context, State) {
                          return checkIfQuoteLoaded(State);
                        }),
                        // Text(allQuote[0].quote,style: TextStyle(color: AppColors.kYellowColor),),
                        SizedBox(
                          height: 20,
                        )
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
