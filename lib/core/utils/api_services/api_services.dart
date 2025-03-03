import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio;

  ApiServices({
    required this.dio,
  });

  Future<Response> get({required String url}) async {
    var response = await dio.get(url);
    return response;
  }
}
