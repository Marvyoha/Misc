import 'package:dio/dio.dart';

class Services {
  final Dio _dio = Dio();
  Future<Response> getData(String url) async {
    return await _dio.get(url);
  }
}
