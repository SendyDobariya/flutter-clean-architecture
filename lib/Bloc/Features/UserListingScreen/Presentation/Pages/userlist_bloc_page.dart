import 'package:clean_demo/Bloc/Core/Base/base_state.dart';
import 'package:clean_demo/Bloc/Core/Const/app_route_const.dart';
import 'package:clean_demo/Bloc/Features/UserListingScreen/Data/Models/user_model.dart';
import 'package:clean_demo/Bloc/Features/UserListingScreen/Domain/Entities/user_entities.dart';
import 'package:clean_demo/Bloc/Features/UserListingScreen/Presentation/Widgets/no_data_found.dart';
import 'package:clean_demo/Bloc/Features/UserListingScreen/Presentation/Widgets/user_listing.dart';
import 'package:clean_demo/Bloc/Features/UserListingScreen/Presentation/bloc/user_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';

class UserlistBlocPage extends StatelessWidget {
  const UserlistBlocPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // context.read<UserBloc>().add(GetUserlistEvent());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc User List"),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed(AddUserFormBlocRoute).then((value) {
              if (value != null) {
                // context.read<UserBloc>().add(GetUserlistEvent());

                context
                    .read<UserBloc>()
                    .add(AppendnewUserEvent((value as List).last));
              }
            });
          }),
      body: SafeArea(
          child: BlocConsumer<UserBloc, BaseState>(
        builder: (context, state) {
          print("States at bloc page =>$state");
          if (state is LoadingState) {
            return const Loading();
          } else if (state is UserListLoadedState) {
            return UserListing(userList: state.userList);
          } else if (state is Nodata) {
            return const NoDataFound();
          } else {
            return Container();
          }
        },
        listener: (context, state) {
          print('state at listner  $state');
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
