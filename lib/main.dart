// Imports

//____General Imports______
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ___Page Imports________
import 'package:Client/pages/onboardingScreen.dart';
import 'package:Client/Models/Activity.dart';
import 'package:Client/Models/User.dart';
import 'package:Client/pages/splashscreen.dart';
import 'package:Client/Helper_Widgets/GeneralHelperMethodManager.dart';
import 'package:Client/Helper_Widgets/GeneralNetworkingMethodManager.dart';
import 'package:Client/Models/Providers/DrawerChangeProvider.dart';
import 'package:Client/Models/Conversation.dart';

// Main Method
void main() async {
  // Running the main App
  runApp(MyApp());
}

// Main Scaffolding for the app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Setting up the app
    setUpApp(context);
    return ChangeNotifierProvider<DrawerChanger>(
      create: (_) => DrawerChanger(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/OnBoarding': (context) => OnBoarding(),
        },
      ),
    );
  }

  // Initializes and sets up all data in preferences
  setUpApp(BuildContext context) async {
    // Instance Variables of Network Manager and general helper manager
    GeneralNetworkingMethodManager generalNetworkingMethodManager =
        new GeneralNetworkingMethodManager(context);

    // Reading the users into the app
    List<User> users =
        await generalNetworkingMethodManager.getUserController().readUsers();

    // Reading the activities into the app
    List<Activity> activities = await generalNetworkingMethodManager
        .getActivityController()
        .readActivities();

    // Reading the conversations into the app
    // List<Conversation> conversations = await generalNetworkingMethodManager
    //     .getConversationController()
    //     .readConversations();

    // Storing all data values needed in app into preferences
    await GeneralHelperMethodManager.storeValuesInPreferences({'users': users});
    await GeneralHelperMethodManager.storeValuesInPreferences(
        {'activities': activities});
  }
}
