import 'package:flutter_assignment/features/customer/data/datasource/user_remote_data_source.dart';
import 'package:flutter_assignment/features/customer/data/model/user_model.dart';
import 'package:flutter_assignment/features/customer/domain/entity/user_entity.dart';
import 'package:flutter_assignment/features/customer/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _userRemoteDataSource;

  UserRepositoryImpl(this._userRemoteDataSource);
  @override
  Future<List<UserEntity>> getUsers(int offset) async {
    List<UserEntity> listOfUserEntity;
    final apiResponse = await _userRemoteDataSource.getUser(offset);
    final List<dynamic> usersList = apiResponse['users'];
    final List<UserModel> userModels = List<UserModel>.from(
      usersList.map((quoteJson) => UserModel.fromJson(quoteJson)),
    );
    listOfUserEntity = userModels
        .map((userModel) => userModel.toEntity())
        .toList();

    return listOfUserEntity;
  }

  @override
  Future<List<UserEntity>> searchUsers(String name) async {
    List<UserEntity> listOfUserEntity;
    final apiResponse = await _userRemoteDataSource.searchUser(name);
    final List<dynamic> usersList = apiResponse['users'];
    final List<UserModel> userModels = List<UserModel>.from(
      usersList.map((quoteJson) => UserModel.fromJson(quoteJson)),
    );
    listOfUserEntity = userModels
        .map((userModel) => userModel.toEntity())
        .toList();

    return listOfUserEntity;
  }
}
