import 'package:clean_demo/Provider/Core/Const/app_route_const.dart';
import 'package:clean_demo/Provider/Features/UserListingScreen/Domain/Entities/user_entities.dart';
import 'package:clean_demo/Provider/Features/UserListingScreen/Presentation/Provider/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserlistProviderPage extends StatelessWidget {
  const UserlistProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // context.read<UserProvider>().setUserListToProvider();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider User List"),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () =>
              Navigator.of(context).pushNamed(AddUserFormProviderRoute)),
      body: SafeArea(
        child: Consumer<UserProvider>(
          builder: (context, userProvider, child) {
            return ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemBuilder: (BuildContext context, int index) {
                  UserEntities _user =
                      userProvider.getUserListFromProvider[index];
                  return Card(
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _user.userName,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                          Text("Email : ${_user.emailId}",
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white)),
                          Text("Age : ${_user.age}",
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white)),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                      height: 5,
                    ),
                itemCount: userProvider.getUserListFromProvider.length);
          },
        ),
      ),
    );
  }
}
