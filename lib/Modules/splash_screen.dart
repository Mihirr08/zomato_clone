import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zomato_ui/Constants/route_constants.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return FutureBuilder(future: navigateTime(),
      builder: (context,snapshot) {
      if(snapshot.data == true){
        WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
          Navigator.pushNamedAndRemoveUntil(
              context, RouteConstants.homePage, (route) => false);
        });
      }
        return Scaffold(
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Lottie.asset("images/lottie/tomato_splash.json",),
                Text(
                  "Tomato",
                  style: TextStyle(
                  fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor, fontSize: 50),
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  Future<bool> navigateTime() async{
    await Future.delayed(const Duration(seconds: 2));

    return true;

  }
}
