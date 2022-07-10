// ignore_for_file: avoid_print

import 'package:clean_demo/SqlWithGetX/Core/NavigationDetails/app_routes_sql.dart';
import 'package:clean_demo/SqlWithGetX/Features/HomeScreen/Presentation/Widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("State Management Listing"),
          actions: [
            IconButton(
                //Default theme change
                onPressed: () => Get.changeTheme(
                    Get.isDarkMode ? ThemeData.light() : ThemeData.dark()),
                icon: Icon(Icons.theater_comedy))
          ],
        ),
        body: SafeArea(
            child: ListView(
          children: <Widget>[
            HomeCard(
                cardString: "GetX",
                onClick: () =>
                    Get.toNamed(AppRoutesSql.UserListingPageSqlRoute)),
          ],
        )));
  }
}
