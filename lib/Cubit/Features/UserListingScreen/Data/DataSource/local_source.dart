import 'package:clean_demo/Cubit/Features/UserListingScreen/Data/Models/user_model.dart';
import 'package:clean_demo/Cubit/Features/UserListingScreen/Domain/Entities/user_entities.dart';

abstract class UserListLocalSource {
  Future<List<UserEntities>> getUsersListFromLocal();
  Future<UserModel> addUserToLocal(UserModel user);
}
