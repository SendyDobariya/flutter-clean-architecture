import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Data/DataSource/local_source_imp.dart';
import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Data/Repositories/user_repository_imp.dart';
import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Domain/Usecases/add_user_case.dart';
import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Domain/Usecases/delete_user_case.dart';
import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Domain/Usecases/update_user_case.dart';
import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Domain/Usecases/user_list_case.dart';
import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Presentation/GetX/user_controller.dart';
import 'package:get/get.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    //UserList CASE
    UserListLocalSourceImp _userListLocalSourceImp = UserListLocalSourceImp();
    UserRepositoryImp _userRepositoryImp =
        UserRepositoryImp(_userListLocalSourceImp);
    UserListUseCase _userListuseCase = UserListUseCase(_userRepositoryImp);

    //AddUser CASE
    AddUserCase _addUserCase = AddUserCase(_userRepositoryImp);

    //delete user case
    DeleteUserCase _deleteUserCase = DeleteUserCase(_userRepositoryImp);

    //update user case
    UpdateUserCase _updateUserCase = UpdateUserCase(_userRepositoryImp);
    Get.put<UserController>(UserController(
        addUserCase: _addUserCase,
        deleteUserCase: _deleteUserCase,
        updateUserCase: _updateUserCase,
        userListUseCase: _userListuseCase));
  }
}
