import 'package:equatable/equatable.dart';

class UserEntities extends Equatable {
  UserEntities({
    required this.userName,
    required this.emailId,
    required this.age,
  });

  String userName;
  String emailId;
  int age;

  @override
  List<Object?> get props => [userName, emailId, age];
}
