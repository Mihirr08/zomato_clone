import 'package:flutter/material.dart';
import 'package:zomato_ui/Constants/ColorConstants.dart';
import 'package:zomato_ui/Constants/ThemeConstants.dart';
import 'package:zomato_ui/SearchField/TopSearchField.dart';
import 'package:zomato_ui/Widgets/SearchScreen.dart';
import 'package:zomato_ui/Widgets/base_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zomato',
      theme: ThemeConstant.primaryTheme,themeMode: ThemeMode.light,
      home: const MyHomePage(),
    );
  }
}

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
        padding: const EdgeInsets.only(top: 24.0),
        child: Column(children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const  SearchScreen();
              }));
            },
            child: const Hero(tag: "topSearchField", child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TopSearchField(fromHome: true,leadingIcon: Icon(Icons.search,color: ColorConstants.redColor,)),
            )),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return const BaseCard();
              },
              itemCount: 10,
            ),
          )
        ]),
      ),
    );
  }
}
