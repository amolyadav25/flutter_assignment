import 'package:dio/dio.dart';
import 'package:flutter_assignment/core/network/api_path.dart';

class ApiClient {
  final Dio _dio;
  ApiClient(this._dio);

  Future<Map<String, dynamic>> getRequest(String url) async {
    try {
      final response = await _dio.get(ApiPath.baseUrl + url);
      return response.data;
    } catch (e) {
      throw Exception('Failed to Load');
    }
  }
}
