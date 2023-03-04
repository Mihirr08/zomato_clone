import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:zomato_ui/Constants/ThemeConstants.dart';
import 'package:zomato_ui/Constants/shared_pref_singleton.dart';


part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {

    on<ThemeEvent>((event, emit) {});

    on<ThemeChange>((event, emit) async{
      await SharedPrefSingleton.sharedInstance.setInt(SharedPrefKeys.themeNumber.name, event.newTheme);
      emit(ThemeChanged(newTheme: ThemeConstant().getThemeByNumber(event.newTheme)));

    });

  }
}
