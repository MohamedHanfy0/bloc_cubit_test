import 'package:bloc_cubit_test/core/strings.dart';
import 'package:dio/dio.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 60 * 1000),
      receiveTimeout: Duration(seconds: 50 * 1000),
    );

    dio = Dio(baseOptions);
  }

  Future<List<dynamic>> fetchCharacters() async {
    try {
      // final response = await dio.get('anime' , queryParameters: {'type': 'ova'});
      final response = await dio.get('characters');
      List<dynamic> exportList = response.data['data'];
      return exportList;
    } catch (e) {
      return [];
    }
  }

  Future<List<dynamic>> getAllQuotes() async {
    late List<dynamic> results;
    try {
      final response = await dio.get('quotes');
      results = response.data;
      return results;
      // return response.data;
    } catch (e) {
      print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
      print(e.toString());
      return [];
    }
  }
}
