import 'package:clean_demo/Provider/Core/Failure/failures.dart';
import 'package:clean_demo/Provider/Core/Usecases/use_case.dart';
import 'package:clean_demo/Provider/Features/UserListingScreen/Data/Models/user_model.dart';
import 'package:clean_demo/Provider/Features/UserListingScreen/Domain/Entities/user_entities.dart';
import 'package:clean_demo/Provider/Features/UserListingScreen/Domain/Usecases/add_user_case.dart';
import 'package:clean_demo/Provider/Features/UserListingScreen/Domain/Usecases/user_list_case.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  AddUserCase addUserCase;
  UserListUseCase userListUseCase;
  UserProvider({required this.addUserCase, required this.userListUseCase});

  List<UserEntities> _userListP = [];

  List<UserEntities> get getUserListFromProvider => _userListP;

  Future<void> setUserListToProvider() async {
    userListUseCase.call(NoParams()).listen((event) {
      event.fold((Failure fail) => print("get listing fail $fail"),
          (List<UserEntities> list) {
        _userListP = list;
        notifyListeners();
      });
    });
  }

  Future<void> addUserToProvider({required UserEntities newUser}) async {
    UserModel user = UserModel(
        userName: newUser.userName, emailId: newUser.emailId, age: newUser.age);
    addUserCase(user).listen((event) {
      event.fold((failuer) => print("Failuer ${failuer}"), (UserModel sussess) {
        _userListP.add(sussess);
        notifyListeners();
      });
    });

    // _userListP.add(newUser);
    // notifyListeners();
  }
}
