import 'package:clean_demo/Cubit/Features/UserListingScreen/Domain/Entities/user_entities.dart';
import 'package:flutter/material.dart';

class UserListing extends StatelessWidget {
  final List<UserEntities> userList;
  const UserListing({Key? key, required this.userList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (BuildContext context, int index) {
          UserEntities _user = userList[index];
          return Card(
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _user.userName,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    "Email : ${_user.emailId}",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Text(
                    "Age : ${_user.age}",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
              height: 5,
            ),
        itemCount: userList.length);
  }
}
