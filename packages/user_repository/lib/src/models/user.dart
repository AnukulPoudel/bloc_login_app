import 'package:equatable/equatable.dart';
import 'package:user_repository/src/entities/entities.dart';

class MyUser extends Equatable {
  final String userId;

  final String email;

  final String name;

  const MyUser({required this.userId, required this.email, required this.name});

  static const empty = MyUser(userId: '', email: '', name: '');

  // since our fields are final so we need to create copyWith method to edit or make copy of the object
  MyUser copyWith({String? userId, String? email, String? name}) {
    return MyUser(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }

  MyUserEntity toEntity() {
    return MyUserEntity(userId: userId, email: email, name: name);
  }

  static MyUser fromEntity(MyUserEntity myUserEntity) { 
    return MyUser(
      userId: myUserEntity.userId,
      email: myUserEntity.email,
      name: myUserEntity.name,
    );
  }

  @override
  List<Object?> get props => [userId, email, name];
}
