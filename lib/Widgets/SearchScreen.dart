import 'package:flutter/material.dart';
import 'package:zomato_ui/SearchField/TopSearchField.dart';

import '../Constants/ColorConstants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 18.0,left: 8,right: 8),
        child: Column(
          children:  [
            Hero(
                tag: "topSearchField",
                child: TopSearchField(fromHome: false,
                  leadingIcon: Material(
                    child: GestureDetector(onTap: (){
                      Navigator.pop(context);
                    }, child: const Icon(Icons.arrow_back_ios,color: ColorConstants.redColor)),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
