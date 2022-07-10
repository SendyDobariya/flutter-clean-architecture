import 'package:clean_demo/GetX/Features/UserListingScreen/Data/DataSource/local_source_imp.dart';
import 'package:clean_demo/GetX/Features/UserListingScreen/Data/Repositories/user_repository_imp.dart';
import 'package:clean_demo/GetX/Features/UserListingScreen/Domain/Usecases/add_user_case.dart';
import 'package:clean_demo/GetX/Features/UserListingScreen/Domain/Usecases/user_list_case.dart';
import 'package:clean_demo/GetX/Features/UserListingScreen/Presentation/GetX/user_controller.dart';
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

    Get.put<UserController>(UserController(_addUserCase, _userListuseCase));
  }
}
