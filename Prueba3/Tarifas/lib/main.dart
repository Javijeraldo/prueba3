import 'package:flutter/material.dart';
//import './paginas/menu_pagina.dart';
//import 'package:onehand/login/SplashScreen.dart';
import 'package:onehand/login/loginscreen.dart';

void main(){
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    //theme: ThemeData.dark(), // Tema Obscuro 
    //theme: ThemeData.light(),  // Tema Claro
    home: new LoginScreen(),
  ));
}




