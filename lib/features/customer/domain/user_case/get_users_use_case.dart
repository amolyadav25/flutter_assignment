
import 'package:flutter_assignment/features/customer/domain/entity/user_entity.dart';

import '../repository/user_repository.dart';

class GetUsersUseCase {
  final UserRepository userRepository;
  GetUsersUseCase({required this.userRepository});
  Future<List<UserEntity>> execute(int offset) async{
   return userRepository.getUsers(offset);
  }
  Future<List<UserEntity>> search(String name) async{
    return userRepository.searchUsers(name);
  }
}