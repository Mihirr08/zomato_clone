part of 'theme_bloc.dart';

abstract class ThemeEvent {}

class ThemeChange extends ThemeEvent {
  int newTheme;

  ThemeChange({required this.newTheme});
}
