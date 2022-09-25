import 'package:breaking_app/constants/strings.dart';
import 'package:dio/dio.dart';

//? using dio
class CharacterWebServices {
  Dio? dio;
  CharacterWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 20 * 1000, //*20 seconds
      receiveDataWhenStatusError: true,
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio!.get('characters');
      // print(response.statusCode);
      // print(response.data);
      return response.data;
    } catch (e) {
      print(e.toString());
      return []; // return empty list
    }
  }
}
