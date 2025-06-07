import 'package:flutter_assignment/core/network/api_client.dart';
import 'package:flutter_assignment/core/network/api_path.dart';

class UserRemoteDataSource {
  final ApiClient _apiClient;

  UserRemoteDataSource(this._apiClient);

  Future<Map<String, dynamic>> getUser(int offset) async {
    try {
      return await _apiClient.getRequest(ApiPath.users(offset));
    } catch (e) {
      throw Exception('Failed to Load $e');
    }
  }
  Future<Map<String, dynamic>> searchUser(String name) async {
    try {
      return await _apiClient.getRequest(ApiPath.search(name));
    } catch (e) {
      throw Exception('Failed to Load $e');
    }
  }
}
