import 'package:clean_demo/Cubit/Core/Const/app_route_const.dart';
import 'package:clean_demo/Cubit/Features/HomeScreen/Presentation/Pages/home_page.dart';
import 'package:clean_demo/Cubit/Features/UserListingScreen/Data/DataSource/local_source_imp.dart';
import 'package:clean_demo/Cubit/Features/UserListingScreen/Data/Repositories/user_repository_imp.dart';
import 'package:clean_demo/Cubit/Features/UserListingScreen/Domain/Usecases/add_user_case.dart';
import 'package:clean_demo/Cubit/Features/UserListingScreen/Domain/Usecases/user_list_case.dart';
import 'package:clean_demo/Cubit/Features/UserListingScreen/Presentation/Pages/add_user_cubit_page.dart';
import 'package:clean_demo/Cubit/Features/UserListingScreen/Presentation/Pages/userlist_cubit_page.dart';
import 'package:clean_demo/Cubit/Features/UserListingScreen/Presentation/cubit/user_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutesCubit {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeRoute:
        return MaterialPageRoute(
            builder: (_) => const HomePage(), settings: settings);
      case CubitUserListRoute:
        return MaterialPageRoute(
            builder: (_) {
              //UserList CASE
              UserListLocalSourceImp _userListLocalSourceImp =
                  UserListLocalSourceImp();
              UserRepositoryImp _userRepositoryImp =
                  UserRepositoryImp(_userListLocalSourceImp);
              UserListUseCase _userListuseCase =
                  UserListUseCase(_userRepositoryImp);

              //AddUser CASE
              AddUserCase _addUserCase = AddUserCase(_userRepositoryImp);
              return BlocProvider(
                create: (context) =>
                    UserCubit(_userListuseCase, _addUserCase)..getUserListing(),
                child: const UserlistCubitPage(),
              );
            },
            settings: settings);
      case AddUserFormCubitRoute:
        return MaterialPageRoute(
            fullscreenDialog: true,
            builder: (_) {
              //UserList CASE
              UserListLocalSourceImp _userListLocalSourceImp =
                  UserListLocalSourceImp();
              UserRepositoryImp _userRepositoryImp =
                  UserRepositoryImp(_userListLocalSourceImp);
              UserListUseCase _userListuseCase =
                  UserListUseCase(_userRepositoryImp);

              //AddUser CASE
              AddUserCase _addUserCase = AddUserCase(_userRepositoryImp);

              return BlocProvider(
                create: (context) => UserCubit(_userListuseCase, _addUserCase),
                child: AddUserCubitPage(),
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
