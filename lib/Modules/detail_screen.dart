import 'package:flutter/material.dart';
import 'package:zomato_ui/Constants/app_constants.dart';
import 'package:zomato_ui/baseWidgets/base_hero.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.heroTag}) : super(key: key);
  final String heroTag;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: BaseHero(
              tag: widget.heroTag,
              child: Image.asset(AppConstants.pizzaImage),
            ),
          ),
        ],
      ),
    );
  }
}
