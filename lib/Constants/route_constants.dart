import 'package:flutter/cupertino.dart';
import 'package:zomato_ui/Modules/SearchScreen.dart';
import 'package:zomato_ui/Modules/detail_screen.dart';
import 'package:zomato_ui/Modules/Home_Page/home_page.dart';
import 'package:zomato_ui/Modules/splash_screen.dart';
import 'package:zomato_ui/Modules/theme_screen/theme_change_screen.dart';

class RouteConstants {
  static const String homePage = "/homePage";
  static const String searchScreen = "/searchScreen";
  static const String splashScreen = "/";
  static const String changeThemeScreen = "/changeThemeScreen";
  static const String detailScreen = "/detailScreen";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget routePage;
    switch (settings.name) {
      case homePage:
        routePage = const MyHomePage();
        break;
      case searchScreen:
        routePage = const SearchScreen();
        break;
      case splashScreen:
        routePage = const SplashScreen();
        break;
      case changeThemeScreen:
        routePage = const ThemeChangeScreen();
        break;
      case detailScreen:
        String tag = (settings.arguments as Map)["heroTag"];
        List<String>? imgName = (settings.arguments as Map)["imageName"];
        int currentIndex = (settings.arguments as Map)["currentIndex"];

        print("Tag is $tag, Img name is $imgName, current index is $currentIndex");

        routePage = DetailScreen(
          heroTag: tag,
          imageName: imgName,
          currentIndex: currentIndex,
        );
        break;
      default:
        routePage = const SplashScreen();
        break;
    }

    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, animation2) => routePage,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
