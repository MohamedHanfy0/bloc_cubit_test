class Character {
  late int id;
  late String name;
  late String nameKanje;
  late int favorites;

  late String about;

  late String images;

  Character.fromJson(Map<String, dynamic> json) {
    id = json['mal_id'];
    name = json['name'];
    nameKanje = json['name_kanji'];
    favorites = json['favorites'];
    images = json['images']['jpg']['image_url'];

    about = json['about'];
  }
}
