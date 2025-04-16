import 'package:clean_architecture/core/api/url_books.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});
  Future<Map<String, dynamic>> get({required String endPoint, var data}) async {
    var response = await dio.get("${UrlBooks.baseUrl}$endPoint", data: data);
    return response.data;
  }
}
