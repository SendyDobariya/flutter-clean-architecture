import 'package:clean_demo/SqlWithGetX/Core/Usecases/use_case.dart';
import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Data/Models/user_model.dart';

import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Domain/Entities/user_entities.dart';
import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Domain/Usecases/add_user_case.dart';
import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Domain/Usecases/delete_user_case.dart';
import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Domain/Usecases/update_user_case.dart';
import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Domain/Usecases/user_list_case.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
//Added usecases
  final UserListUseCase userListUseCase;
  final AddUserCase addUserCase;
  final DeleteUserCase deleteUserCase;
  final UpdateUserCase updateUserCase;
  UserController(
      {required this.updateUserCase,
      required this.deleteUserCase,
      required this.addUserCase,
      required this.userListUseCase});

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
    userListUseCase.call(NoParams()).listen((event) {
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
    addUserCase(user).listen((event) {
      event.fold((fail) {
        print("add user fail ${fail.toString()}");
        Get.snackbar("Fail", "${fail}", snackPosition: SnackPosition.BOTTOM);
        loading = false;
        update();
      }, (UserModel success) {
        userlist.add(success);
        update();
        Get.back();
      });
    });
  }

  Future<void> deleteUsergetX({required UserModel user}) async {
    print("User At controller $user");
    deleteUserCase.call(user).listen((event) {
      event.fold((fail) {
        print("Dlete from SQL Fail");
        Get.snackbar("Fail", "${fail}", snackPosition: SnackPosition.BOTTOM);
      }, (bool x) {
        print("Delete Succ $x");
        userlist.removeWhere((element) => element.userId == user.userId);
        update();
      });
    });
  }

  Future<void> updateUsergetX({required UserModel user}) async {
    updateUserCase(user).listen((event) {
      event.fold((fail) {
        // ignore: avoid_print
        print("Fail To updated the records ${fail}");
        Get.snackbar("Fail", "${fail}", snackPosition: SnackPosition.BOTTOM);
      }, (UserEntities updatedUser) {
        print("User Updated Succ  ${updatedUser}");

        List<UserEntities> _updatedList = [];

        // for (UserEntities item in userlist) {
        //   if (item.userId == updatedUser.userId) {
        //     _updatedList.add(UserModel(
        //         age: updatedUser.age,
        //         userId: updatedUser.userId,
        //         emailId: updatedUser.emailId,
        //         userName: updatedUser.userName));
        //   } else {
        //     _updatedList.add(item);
        //   }
        // }
        // userlist = _updatedList;

        userlist.map((e) {
          if (e.userId == updatedUser.userId) {
            _updatedList.add(updatedUser);
          } else {
            _updatedList.add(e);
          }
        }).toList();

        userlist = _updatedList;

        print("LIST =>>> $userlist");
        update();
        Get.back();
      });
    });
  }
}
