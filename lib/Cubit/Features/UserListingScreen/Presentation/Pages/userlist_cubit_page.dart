import 'package:clean_demo/Cubit/Core/Base/base_state.dart';
import 'package:clean_demo/Cubit/Core/Const/app_route_const.dart';
import 'package:clean_demo/Cubit/Core/Theme/config.dart';
import 'package:clean_demo/Cubit/Features/UserListingScreen/Data/Models/user_model.dart';
import 'package:clean_demo/Cubit/Features/UserListingScreen/Domain/Entities/user_entities.dart';
import 'package:clean_demo/Cubit/Features/UserListingScreen/Presentation/Widgets/user_listing.dart';
import 'package:clean_demo/Cubit/Features/UserListingScreen/Presentation/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserlistCubitPage extends StatelessWidget {
  const UserlistCubitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // context.read<UserCubit>().getUserListing();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubit User List"),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => Navigator.of(context)
                  .pushNamed(AddUserFormCubitRoute)
                  .then((value) {
                if (value != null) {
                  context
                      .read<UserCubit>()
                      .appendNewUser(addedUser: (value as List).last);
                }
              })),
      body: SafeArea(
          child: BlocConsumer<UserCubit, BaseState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Loading();
          } else if (state is UserListLoadedState) {
            return UserListing(userList: state.userList);
          } else if (state is Nodata) {
            return const Center(
              child: Text('No Data Found'),
            );
          } else {
            return Container();
          }
        },
        listener: (context, state) {
          if (state is LoadingState) {
            print("Loading State");
          }
          if (state is UserListLoadedState) {
            print("Loaded State");
          }
        },
      )),
    );
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
