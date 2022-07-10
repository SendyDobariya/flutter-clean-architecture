import 'package:clean_demo/SqlWithGetX/Core/NavigationDetails/app_routes_sql.dart';
import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Data/Models/user_model.dart';
import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Domain/Entities/user_entities.dart';

import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Presentation/GetX/user_controller.dart';
import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Presentation/Widgets/user_listing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserlistSqlPage extends StatelessWidget {
  const UserlistSqlPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserController>();
    return Scaffold(
        appBar: AppBar(
          title: const Text("GetX User List"),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => Get.toNamed(AppRoutesSql.AddUserPageSqlRoute)),
        body: SafeArea(
            child: GetBuilder<UserController>(
          initState: (_) {},
          builder: (data) {
            if (data.loading) {
              return Loading();
            } else if (data.userlist.isEmpty) {
              return const Center(child: Text("No Data Found"));
            } else {
              return UserListing(
                userList: data.userlist,
                onEdit: (UserEntities user) {
                  print("Edit Click $user");
                  Get.toNamed(AppRoutesSql.AddUserPageSqlRoute,
                      arguments: user);
                },
                onDelete: (UserEntities user) {
                  print("Card Click $user");
                  UserModel userE = UserModel(
                      userName: user.userName,
                      emailId: user.emailId,
                      age: user.age,
                      userId: user.userId);
                  print("UserE =>$userE");
                  controller.deleteUsergetX(user: userE);
                },
              );
            }
          },
        )));
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
