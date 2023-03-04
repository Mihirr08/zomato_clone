part of 'theme_bloc.dart';

abstract class ThemeState {}

class ThemeInitial extends ThemeState{}

class ThemeChanged extends ThemeState {
  ThemeData newTheme;

  ThemeChanged({required this.newTheme});

}
