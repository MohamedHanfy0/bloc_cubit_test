import 'package:bloc_cubit_test/core/app_style/app_colors.dart';
import 'package:bloc_cubit_test/core/strings.dart';
import 'package:bloc_cubit_test/data/models/characters.dart';
import 'package:flutter/material.dart';

class CharactersItem extends StatelessWidget {
  final Character character;
  const CharactersItem({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: AppColors.kWhaiteColor, width: 2),
        color: AppColors.kWhaiteColor,
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, charactersDetailsScreen,
              arguments: character);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: GridTile(
            footer: Hero(
              tag: character.id,
              child: Container(
                // width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                color: Colors.black38,
                alignment: Alignment.bottomCenter,
                child: Text(
                  character.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                    color: AppColors.kWhaiteColor,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            child: Container(
              color: const Color.fromARGB(255, 3, 91, 214),
              child: Image.network(
                character.images,
                fit: BoxFit.cover,
                // loadingBuilder: (BuildContext context, Widget child,
                //     ImageChunkEvent? loadingProgress) {
                //   if (loadingProgress == null) {
                //     return child;
                //   } else {
                //     return Center(
                //       child: CircularProgressIndicator(
                //         color: Color(0xfff1f1f1),
                //         value: loadingProgress.expectedTotalBytes != null
                //             ? loadingProgress.expectedTotalBytes != null
                //                 ? loadingProgress.cumulativeBytesLoaded /
                //                     (loadingProgress.expectedTotalBytes ?? 1)
                //                 : null
                //             : null,
                //       ),
                //     );
                //   }
                // },
                // errorBuilder: (BuildContext context, Object error,
                //     StackTrace? stackTrace) {
                //   return Center(
                //     child: Icon(Icons.error, color: Colors.red),
                //   );
                // },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
