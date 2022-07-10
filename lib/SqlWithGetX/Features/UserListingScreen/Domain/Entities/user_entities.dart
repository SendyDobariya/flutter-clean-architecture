import 'package:equatable/equatable.dart';

class UserEntities extends Equatable {
  UserEntities(
      {required this.userName,
      required this.emailId,
      required this.age,
      this.userId});

  String userName;
  String emailId;
  int age;
  int? userId;

  @override
  List<Object?> get props => [];
}
