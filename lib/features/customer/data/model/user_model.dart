import '../../domain/entity/user_entity.dart';

class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String image;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'image': image,
    };
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      fullName: "$firstName $lastName",
      email: email,
      image: image,
    );
  }
}
