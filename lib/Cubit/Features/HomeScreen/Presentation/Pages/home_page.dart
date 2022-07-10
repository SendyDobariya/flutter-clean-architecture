// ignore_for_file: avoid_print

import 'package:clean_demo/Cubit/Core/Const/app_route_const.dart';
import 'package:clean_demo/Cubit/Core/Theme/config.dart';
import 'package:clean_demo/Cubit/Features/HomeScreen/Presentation/Widgets/home_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("State Management Listing"),
          actions: [
            IconButton(
              icon: const Icon(Icons.brightness_4),
              onPressed: () => currentTheme.toggleTheme(),
            )
          ],
        ),
        body: SafeArea(
            child: ListView(
          children: <Widget>[
            HomeCard(
                cardString: "Cubit",
                onClick: () =>
                    Navigator.of(context).pushNamed(CubitUserListRoute)),
          ],
        )));
  }
}
