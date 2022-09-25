import 'package:breaking_app/constants/strings.dart';
import 'package:dio/dio.dart';

class EpisodeWebServices {
  Dio? dio;
  EpisodeWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 20 * 1000,
      receiveDataWhenStatusError: true,
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getAllEpisodes() async {
    try {
      Response response = await dio!.get('episodes');
      // print(response.statusCode);
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
