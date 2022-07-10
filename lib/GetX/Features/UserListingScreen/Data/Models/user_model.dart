// import 'package:clean_demo/Features/UserListingScreen/Domain/Entities/user_entities.dart';

// class UserModel extends UserEntities {
//   String userName;
//   String emailId;
//   int age;

//   UserModel({
//     required this.userName,
//     required this.emailId,
//     required this.age,
//   }) : super(age: age, emailId: emailId, userName: userName);

//   factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//         userName: json['user_name'] == null ? null : json["user_name"],
//         emailId: json['email_id'] == null ? null : json["email_id"],
//         age: json['age'] == null ? null : json["age"],
//       );

//   Map<String, dynamic> toJson() => {
//         'user_name': userName == null ? null : userName,
//         'email_id': emailId == null ? null : emailId,
//         'age': age == null ? null : age,
//       };
// }

import 'package:clean_demo/GetX/Features/UserListingScreen/Domain/Entities/user_entities.dart';
import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends UserEntities {
  @HiveField(0)
  final String userName;
  @HiveField(1)
  final String emailId;
  @HiveField(2)
  final int age;

  UserModel({required this.userName, required this.emailId, required this.age})
      : super(age: age, emailId: emailId, userName: userName);
}
