// Imports 

//____General Imports______
import 'package:flutter/material.dart';

// ___Page Imports________
import './Pages/home.dart';
import './Pages/login.dart';
import './Pages/signup.dart';
// import './Pages/loading.dart';
import './Pages/onboardingScreen.dart';
import './Pages/splashscreen.dart';

// Setting up routes and paths for the flutter app  
void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => SplashScreen(),
      '/OnBoarding': (context) => OnBoarding(),
      '/login': (context) => Login(),
      '/signup': (context) => SignUp(),
      '/Home': (context) => Home(),
    }
));