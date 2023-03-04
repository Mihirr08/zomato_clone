import 'package:flutter/material.dart';
import 'package:zomato_ui/Constants/ThemeConstants.dart';
import 'package:zomato_ui/Constants/route_constants.dart';
import 'package:zomato_ui/Constants/shared_pref_singleton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Modules/theme_screen/theme_bloc/theme_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPrefSingleton.sharedInstance.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeBloc themeBloc = ThemeBloc();

  late ThemeData currentTheme;

  @override
  void initState() {
    super.initState();
    currentTheme = ThemeConstant().getThemeByNumber(SharedPrefSingleton
            .sharedInstance
            .getInt(SharedPrefKeys.themeNumber.name) ??
        0);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => themeBloc,
      child: BlocBuilder(
        bloc: themeBloc,
        builder: (context, state) {
          if (state is ThemeChanged) {
            currentTheme = state.newTheme;
          }
          return MaterialApp(debugShowCheckedModeBanner: false,
            title: 'Tomato',
            theme:
                currentTheme, //ThemeConstant.primaryTheme, themeMode: ThemeMode.light,
            // home: const SplashScreen(),
            onGenerateRoute: RouteConstants.generateRoute,
            initialRoute: RouteConstants.splashScreen,
          );
        },
      ),
    );
  }
}
