
import 'package:flutter/material.dart';
class HelperFunctions{
  static navigateToScreen(Widget screen,BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (_)=>screen));
  }
}