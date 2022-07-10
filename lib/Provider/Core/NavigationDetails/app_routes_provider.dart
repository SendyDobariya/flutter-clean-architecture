import 'package:clean_demo/Provider/Core/Const/app_route_const.dart';
import 'package:clean_demo/Provider/Features/HomeScreen/Presentation/Pages/home_page.dart';
import 'package:clean_demo/Provider/Features/UserListingScreen/Data/DataSource/local_source_imp.dart';
import 'package:clean_demo/Provider/Features/UserListingScreen/Data/Repositories/user_repository_imp.dart';
import 'package:clean_demo/Provider/Features/UserListingScreen/Domain/Usecases/add_user_case.dart';
import 'package:clean_demo/Provider/Features/UserListingScreen/Domain/Usecases/user_list_case.dart';
import 'package:clean_demo/Provider/Features/UserListingScreen/Presentation/Pages/add_user_provider_page.dart';
import 'package:clean_demo/Provider/Features/UserListingScreen/Presentation/Pages/userlist_provider_page.dart';
import 'package:clean_demo/Provider/Features/UserListingScreen/Presentation/Provider/users_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeRoute:
        return MaterialPageRoute(
            builder: (_) => const HomePage(), settings: settings);
      case ProviderUserListRoute:
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider<UserProvider>(
                create: (_) => UserProvider(
                    addUserCase: AddUserCase(
                        UserRepositoryImp(UserListLocalSourceImp())),
                    userListUseCase: UserListUseCase(
                        UserRepositoryImp(UserListLocalSourceImp())))
                  ..setUserListToProvider(),
                child: const UserlistProviderPage()),
            settings: settings);
      case AddUserFormProviderRoute:
        return MaterialPageRoute(
            fullscreenDialog: true,
            builder: (_) => ChangeNotifierProvider(
                create: (_) => UserProvider(
                    addUserCase: AddUserCase(
                        UserRepositoryImp(UserListLocalSourceImp())),
                    userListUseCase: UserListUseCase(
                        UserRepositoryImp(UserListLocalSourceImp()))),
                child: AddUserPage()),
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
