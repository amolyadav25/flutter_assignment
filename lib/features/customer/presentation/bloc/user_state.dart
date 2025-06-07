import 'package:equatable/equatable.dart';
import 'package:flutter_assignment/features/customer/domain/entity/user_entity.dart';

abstract class UserState extends Equatable {
  const UserState();
  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {
  const UserInitial();
}

class UserLoading extends UserState {
  const UserLoading();
}

class UserLoaded extends UserState {
  final List<UserEntity> userList;
  const UserLoaded(this.userList);
  @override
  List<Object> get props => [userList];
}

class UserError extends UserState {
  final String errorMessage;
  const UserError(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
