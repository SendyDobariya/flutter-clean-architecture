import 'package:clean_demo/GetX/Features/UserListingScreen/Data/Models/user_model.dart';
import 'package:clean_demo/GetX/Core/Usecases/use_case.dart';
import 'package:clean_demo/GetX/Features/UserListingScreen/Domain/Entities/user_entities.dart';
import 'package:clean_demo/GetX/Features/UserListingScreen/Domain/Usecases/add_user_case.dart';
import 'package:clean_demo/GetX/Features/UserListingScreen/Domain/Usecases/user_list_case.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
//Added usecases
  UserListUseCase _userListUseCase;
  AddUserCase _addUserCase;
  UserController(this._addUserCase, this._userListUseCase);

  List<UserEntities> userlist = [];
  bool loading = true;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserListGetX();
  }

  Future<void> getUserListGetX() async {
    await Future.delayed(Duration(seconds: 1));
    _userListUseCase.call(NoParams()).listen((event) {
      event.fold((Fail) {
        print("getUserList fail in get x =>$Fail");
        loading = false;
        update();
      }, (List<UserEntities> success) {
        userlist = success;
        loading = false;
        update();
      });
    });
  }

  Future<void> addUserGetX({required UserModel user}) async {
    _addUserCase(user).listen((event) {
      event.fold((fail) {
        print("add user fail ${fail.toString()}");
        loading = false;
        update();
      }, (UserModel success) {
        userlist.add(success);
        update();
      });
    });
  }
}
