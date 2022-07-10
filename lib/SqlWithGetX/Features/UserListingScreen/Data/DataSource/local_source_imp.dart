import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Data/DataSource/local_source.dart';
import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Data/Models/user_model.dart';
import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Domain/Entities/user_entities.dart';
import 'package:clean_demo/main.dart';

class UserListLocalSourceImp extends UserListLocalSource {
  @override
  Future<UserModel> addUserToLocal(UserModel user) async {
    // TODO: add sql code here

    List<Map> list = await userDataBase.rawQuery(
        'INSERT INTO ${dataBaseHelper.userTable}(user_name, age, email_id) VALUES("${user.userName}", "${user.age}", "${user.emailId}")');
    print("List =>XX $list");
    // Map<String, dynamic> userMap = {
    //   'email_id': user.emailId,
    //   'age': user.age,
    //   'user_name': user.userName
    // };
    // db.insert(DataBaseNames().UserDb, userMap);
    List<Map> list1 = await userDataBase
        .rawQuery('SELECT * FROM ${dataBaseHelper.userTable}');
    print("ALL DATA DB =>$list1");

    return user;
  }

  @override
  Future<List<UserEntities>> getUsersListFromLocal() async {
    List<Map<String, dynamic>> list1 = await userDataBase
        .rawQuery('SELECT * FROM ${dataBaseHelper.userTable}');

    List<UserEntities> x = list1.map((e) => UserModel.fromJson(e)).toList();
    print("List from db =>>> $list1");

    return x;
  }

  @override
  Future<bool> deleteUserFromLocal(UserModel user) async {
    var x = await userDataBase.rawQuery(
        'DELETE FROM ${dataBaseHelper.userTable} WHERE user_id="${user.userId}"');
    print("XXX=>>>>$x");
    return true;
  }

  @override
  Future<UserModel> updateUserFromLocal(UserModel user) async {
    var x = await userDataBase.rawQuery(
        'UPDATE ${dataBaseHelper.userTable} SET user_name = "${user.userName}", age = "${user.age}", email_id = "${user.emailId}" WHERE user_id="${user.userId}"');

    return user;
  }
}
