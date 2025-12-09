import 'package:equatable/equatable.dart';

// entity -> used for communicating with firebase

// Equatable is not needed but to make it consistent we extend it
class MyUserEntity extends Equatable {
  final String userId;

  final String email;

  final String name;

  const MyUserEntity({
    required this.userId,
    required this.email,
    required this.name,
  });

  Map<String, dynamic> toDocument() {
    return {"userId": userId, "email": email, "name": name};
  }

  static MyUserEntity fromDocument(Map<String, dynamic> document) {
    return MyUserEntity(
      userId: document["userId"],
      email: document["email"],
      name: document["name"],
    );
  }

  @override
  List<Object?> get props => [userId, email, name];
}
