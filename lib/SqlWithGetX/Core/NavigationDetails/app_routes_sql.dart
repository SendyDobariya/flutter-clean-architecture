import 'package:clean_demo/SqlWithGetX/Features/HomeScreen/Presentation/Pages/home_page.dart';
import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Presentation/GetX/user_binding.dart';
import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Presentation/Pages/add_user_getx_page.dart';

import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Presentation/Pages/userlist_sql_page.dart';
import 'package:get/get.dart';

class AppRoutesSql {
  static const HomePageSqlRoute = '/';
  static const UserListingPageSqlRoute = '/userlist-page-sql';
  static const AddUserPageSqlRoute = '/add-user-page-sql';

  static final routes = [
    GetPage(
      name: HomePageSqlRoute,
      page: () => HomePage(),
    ),
    GetPage(
      name: UserListingPageSqlRoute,
      page: () => UserlistSqlPage(),
      binding: UserBinding(),
    ),
    GetPage(
        name: AddUserPageSqlRoute,
        binding: UserBinding(),
        page: () => AddUserSqlPage(),
        fullscreenDialog: true)
  ];
}
