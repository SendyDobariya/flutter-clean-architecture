import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Domain/Entities/user_entities.dart';

class UserModel extends UserEntities {
  String userName;
  String emailId;
  int age;
  int? userId;

  UserModel(
      {required this.userName,
      required this.emailId,
      required this.age,
      this.userId})
      : super(age: age, emailId: emailId, userName: userName, userId: userId);

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userName: json['user_name'] == null ? null : json["user_name"],
        emailId: json['email_id'] == null ? null : json["email_id"],
        age: json['age'] == null ? null : json["age"],
        userId: json['user_id'] == null ? null : json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        'user_name': userName == null ? null : userName,
        'email_id': emailId == null ? null : emailId,
        'age': age == null ? null : age,
        'user_id': userId == null ? null : userId
      };
}
