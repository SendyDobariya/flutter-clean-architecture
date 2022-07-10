import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Domain/Entities/user_entities.dart';
import 'package:flutter/material.dart';

class UserListing extends StatelessWidget {
  final List<UserEntities> userList;
  final Function? onDelete;
  final Function? onEdit;
  const UserListing({required this.userList, this.onDelete, this.onEdit});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (BuildContext context, int index) {
          UserEntities _user = userList[index];
          return Stack(
            children: [
              Container(
                width: double.infinity,
                child: Card(
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
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: IconButton(
                    onPressed: () => onDelete!(_user),
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    )),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                    onPressed: () => onEdit!(_user),
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    )),
              )
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
              height: 5,
            ),
        itemCount: userList.length);
  }
}
