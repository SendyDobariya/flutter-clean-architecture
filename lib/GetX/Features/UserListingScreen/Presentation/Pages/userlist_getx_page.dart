import 'package:clean_demo/GetX/Core/NavigationDetails/app_routes_getx.dart';
import 'package:clean_demo/GetX/Features/UserListingScreen/Presentation/GetX/user_controller.dart';
import 'package:clean_demo/GetX/Features/UserListingScreen/Presentation/Widgets/user_listing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserlistGetXPage extends StatelessWidget {
  const UserlistGetXPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<UserController>();
    return Scaffold(
        appBar: AppBar(
          title: const Text("GetX User List"),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => Get.toNamed(AppRoutesGetX.AddUserPageGetX)),
        body: SafeArea(
            child: GetBuilder<UserController>(
          initState: (_) {},
          builder: (data) {
            if (data.loading) {
              return Loading();
            } else if (data.userlist.isEmpty) {
              return const Center(child: Text("No Data Found"));
            } else {
              return UserListing(userList: data.userlist);
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
