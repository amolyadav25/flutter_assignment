
import 'package:flutter_assignment/features/customer/domain/entity/user_entity.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getUsers(int offset);
  Future<List<UserEntity>> searchUsers(String name);
}