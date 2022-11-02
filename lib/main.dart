import 'package:flutter/material.dart';
import 'package:worldtime/pages/loading.dart';
import 'package:worldtime/pages/home.dart';
import 'package:worldtime/pages/chooselocation.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/chooselocation': (context) => ChooseLocation(),
    },
  ));
}


