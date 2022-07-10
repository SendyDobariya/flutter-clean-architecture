import 'package:clean_demo/GetX/Features/HomeScreen/Presentation/Pages/home_page.dart';
import 'package:clean_demo/GetX/Features/UserListingScreen/Presentation/GetX/user_binding.dart';
import 'package:clean_demo/GetX/Features/UserListingScreen/Presentation/Pages/add_user_getx_page.dart';

import 'package:clean_demo/GetX/Features/UserListingScreen/Presentation/Pages/userlist_getx_page.dart';
import 'package:get/get.dart';

class AppRoutesGetX {
  static const HomePageGetX = '/';
  static const UserListingPageGetX = '/userlist-getx-page';
  static const AddUserPageGetX = '/add-user-get-page';

  static final routes = [
    GetPage(
      name: HomePageGetX,
      page: () => HomePage(),
    ),
    GetPage(
      name: UserListingPageGetX,
      page: () => UserlistGetXPage(),
      binding: UserBinding(),
    ),
    GetPage(
        name: AddUserPageGetX,
        binding: UserBinding(),
        page: () => AddUserGetXPage(),
        fullscreenDialog: true)
  ];
}
