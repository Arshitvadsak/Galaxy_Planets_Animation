import'package:flutter/material.dart';
import 'package:galaxy_planets/views/screen/Home_Page.dart';
import 'package:galaxy_planets/views/screen/Second_Page.dart';

void main(){
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/':(context) => HomePage(),
          'Menu': (context) => MenuPage(),
        },
      )
  );
}
