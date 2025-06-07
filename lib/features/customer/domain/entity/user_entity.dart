import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String fullName;
  final String email;
  final String image;

  const UserEntity({
    required this.id,
    required this.fullName,
    required this.email,
    required this.image,
  });

  @override
  List<Object?> get props => [id, fullName, email, image];
}
