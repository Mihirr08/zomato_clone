import "package:flutter/material.dart";
import "package:zomato_ui/Constants/route_constants.dart";
import 'package:zomato_ui/Modules/theme_screen/theme_change_screen.dart';

import "../SearchField/TopSearchField.dart";
import "SearchScreen.dart";
import "base_card.dart";


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 35.0),
        child: Column(children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RouteConstants.searchScreen);
            },
            child: Hero(
                tag: "topSearchField",
                child: Material(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TopSearchField(showSetting: true,
                        isText: true,
                        leadingIcon: Icon(
                          Icons.search,
                          color: Theme.of(context).primaryColor,
                        )),
                  ),
                )),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return BaseCard(index: index,);
              },
              itemCount: 10,
            ),
          )
        ]),
      ),
    );
  }
}
