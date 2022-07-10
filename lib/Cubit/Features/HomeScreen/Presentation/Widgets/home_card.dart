import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final GestureTapCallback? onClick;
  final String cardString;
  HomeCard({this.onClick, required this.cardString});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Card(
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            cardString,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
      ),
    );
  }
}
