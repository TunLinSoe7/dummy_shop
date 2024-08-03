import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

class NavigationProvider extends ChangeNotifier{
  int _currentIndex = 0;
  int get currentIndex =>_currentIndex;

  set setIndex(int index){
    _currentIndex = index;
    notifyListeners();
  }
  List<Widget> screens = [const HomeScreen(),Container(),Container(),Container(),Container()];

}