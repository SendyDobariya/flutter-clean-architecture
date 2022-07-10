import 'package:clean_demo/Bloc/Core/Const/app_route_const.dart';
import 'package:clean_demo/Bloc/Features/HomeScreen/Presentation/Pages/home_page.dart';
import 'package:clean_demo/Bloc/Features/UserListingScreen/Data/DataSource/local_source_imp.dart';
import 'package:clean_demo/Bloc/Features/UserListingScreen/Data/Repositories/user_repository_imp.dart';
import 'package:clean_demo/Bloc/Features/UserListingScreen/Domain/Usecases/add_user_case.dart';
import 'package:clean_demo/Bloc/Features/UserListingScreen/Domain/Usecases/user_list_case.dart';
import 'package:clean_demo/Bloc/Features/UserListingScreen/Presentation/Pages/add_user_bloc_page.dart';
import 'package:clean_demo/Bloc/Features/UserListingScreen/Presentation/Pages/userlist_bloc_page.dart';
import 'package:clean_demo/Bloc/Features/UserListingScreen/Presentation/bloc/user_bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clean_demo/injection_container.dart';

class AppRoutesBloc {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeRoute:
        return MaterialPageRoute(
            builder: (_) => const HomePage(), settings: settings);
      case BlocUserListRoute:
        return MaterialPageRoute(
            builder: (_) {
              // UserList CASE
              UserListLocalSourceImp _userListLocalSourceImp =
                  UserListLocalSourceImp();
              UserRepositoryImp _userRepositoryImp =
                  UserRepositoryImp(_userListLocalSourceImp);
              UserListUseCase _userListuseCase =
                  UserListUseCase(_userRepositoryImp);

              // AddUser CASE
              AddUserCase _addUserCase = AddUserCase(_userRepositoryImp);
              return BlocProvider(
                create: (context) => UserBloc(_addUserCase, _userListuseCase)
                  ..add(GetUserlistEvent()),
                //  UserBloc(_addUserCase, _userListuseCase)
                //   ..add(GetUserlistEvent()),
                child: const UserlistBlocPage(),
              );

              // return UserlistBlocPage();
            },
            settings: settings);
      case AddUserFormBlocRoute:
        return MaterialPageRoute(
            fullscreenDialog: true,
            builder: (_) {
              // UserList CASE
              UserListLocalSourceImp _userListLocalSourceImp =
                  UserListLocalSourceImp();
              UserRepositoryImp _userRepositoryImp =
                  UserRepositoryImp(_userListLocalSourceImp);
              UserListUseCase _userListuseCase =
                  UserListUseCase(_userRepositoryImp);

              //AddUser CASE
              AddUserCase _addUserCase = AddUserCase(_userRepositoryImp);
              print(sl<UserBloc>() == UserBloc(_addUserCase, _userListuseCase));
              return
                  // BlocProvider.value(
                  //   value: BlocProvider.of<UserBloc>(context),
                  // child: AddUserBlocPage(),
                  // )

                  BlocProvider(
                create: (context) => sl<UserBloc>(),
                child: AddUserBlocPage(),
              );
            },
            settings: settings);
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ),
            settings: settings);
    }
  }
}
