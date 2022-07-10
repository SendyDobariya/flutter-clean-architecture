// ignore_for_file: avoid_print

import 'package:clean_demo/Provider/Core/Const/app_route_const.dart';
import 'package:clean_demo/Provider/Features/HomeScreen/Presentation/Widgets/home_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("State Management Listing"),
        ),
        body: SafeArea(
            child: ListView(
          children: <Widget>[
            HomeCard(
                cardString: "Provider",
                onClick: () =>
                    Navigator.of(context).pushNamed(ProviderUserListRoute)),
          ],
        )));
  }
}
