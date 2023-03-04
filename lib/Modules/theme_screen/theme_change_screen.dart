import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zomato_ui/Constants/ThemeConstants.dart';
import 'package:zomato_ui/Constants/shared_pref_singleton.dart';
import 'package:zomato_ui/Modules/theme_screen/theme_bloc/theme_bloc.dart';
import 'package:zomato_ui/SearchField/TopSearchField.dart';

class ThemeChangeScreen extends StatelessWidget {
  const ThemeChangeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).primaryColor),
      body: Center(
          child: Column(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Center(
                    child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "This is a preview",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppBar(
                              leading: const Icon(Icons.arrow_back_ios),
                            ),
                            const TopSearchField(
                                leadingIcon: Icon(
                                  Icons.settings,
                                  color: Colors.transparent,
                                ),
                                isText: true,
                                text: "Preview for search field"),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Theme.of(context).primaryColor),
                                onPressed: () {},
                                child: const Text(
                                  "Button",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
              )),
          Row(
            children: [
              getColorBall(Colors.red, context, 0),
              getColorBall(Colors.purple, context, 1),
            ],
          ),
        ],
      )),
    );
  }

  Widget getColorBall(Color color, BuildContext context, int newThemeNumber) {
    return InkWell(
      onTap: () {
        BlocProvider.of<ThemeBloc>(context).add(
          ThemeChange(newTheme: newThemeNumber),
        );
      },
      child: Padding(
        padding: EdgeInsets.all(14),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
          ),
          height: 80,
          width: 80,
        ),
      ),
    );
  }
}
