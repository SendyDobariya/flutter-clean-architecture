import 'package:clean_demo/Bloc/Features/UserListingScreen/Domain/Entities/user_entities.dart';
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
