import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  static const String baseUrl = "https://api.themoviedb.org/3/movie/";
  static const String apiKey = "68a8ab87354999521087e3a134305698";

  ApiService(this.dio);

  Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await dio.get(
      "$baseUrl$endpoint",
      queryParameters: {"api_key": apiKey},
    );

    return response.data;
  }
}
