import 'package:clean_demo/Bloc/Core/Helper/hive_helper.dart';
import 'package:clean_demo/Bloc/Features/UserListingScreen/Data/DataSource/local_source.dart';
import 'package:clean_demo/Bloc/Features/UserListingScreen/Data/Models/user_model.dart';
import 'package:clean_demo/Bloc/Features/UserListingScreen/Domain/Entities/user_entities.dart';

import 'package:hive/hive.dart';

HiveHelper hiveHelper = HiveHelper();

class UserListLocalSourceImp extends UserListLocalSource {
  @override
  Future<UserModel> addUserToLocal(UserModel user) async {
    if (!hiveHelper.isBoxOpen()) {
      await hiveHelper.open();
      Box x = await hiveHelper.hiveLocalBox();
      x.add(user);
      print("Data from hive If=> ${x.values.toList()}");
      return x.values.last;
    } else {
      Box x = await hiveHelper.hiveLocalBox();
      x.add(user);
      print("Data from hive Else1=> ${x.values.toList()}");
      return x.values.last;
    }
  }

  @override
  Future<List<UserEntities>> getUsersListFromLocal() async {
    if (!hiveHelper.isBoxOpen()) {
      await hiveHelper.open();
      Box x = await hiveHelper.hiveLocalBox();
      List<UserEntities> list = x.values
          .map((e) => UserEntities(
              userName: e.userName, emailId: e.emailId, age: e.age))
          .toList();

      return list;
    } else {
      Box x = await hiveHelper.hiveLocalBox();

      List<UserEntities> list = x.values
          .map((e) => UserEntities(
              userName: e.userName, emailId: e.emailId, age: e.age))
          .toList();

      return list;
    }
  }
}
