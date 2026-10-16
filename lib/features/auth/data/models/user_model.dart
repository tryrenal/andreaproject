import 'package:andreaproject/features/auth/domain/entities/user.dart'
    show User;

class UserModel extends User {
  UserModel({required super.id, required super.emaill, required super.name});

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      emaill: map['emaill'] ?? '',
      name: map['name'] ?? '',
    );
  }
}
