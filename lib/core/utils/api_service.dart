import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  final Dio dio;
  static const String baseUrl = "https://api.themoviedb.org/3/movie/";
  static const String apiKey = "68a8ab87354999521087e3a134305698";

  ApiService(this.dio) {
    dio.options.headers.addAll({
      "Accept": "application/json",
      "Content-Type": "application/json",
    });

    if (kDebugMode) {
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            debugPrint("Movies API headers: ${options.headers}");
            handler.next(options);
          },
          onResponse: (response, handler) {
            debugPrint("Movies API response: ${response.data}");
            handler.next(response);
          },
        ),
      );
    }
  }

  Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await dio.get(
      "$baseUrl$endpoint",
      queryParameters: {"api_key": apiKey},
    );

    return response.data;
  }
}
