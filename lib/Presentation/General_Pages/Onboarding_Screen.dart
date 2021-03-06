// Imports and Variable Declarations

// Library Imports
import 'package:Client/Config/configVariables.dart';
import 'package:Client/Helpers/Libs_Required.dart';
import 'package:Client/Presentation/User_Management/Create_User_Management/Create_User_BasicSignUp.dart';
import 'package:flutter/material.dart';

// Page Imports
import 'package:Client/Infrastructure/Models/User.dart';
import 'package:Client/Helpers/ButtonProducer.dart';
import 'package:Client/Presentation/User_Management/Read_User_Management/Read_User_Login.dart';

// Onboarding Page
class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

// Template for what makes onboarding page
class _OnBoardingState extends State<OnBoarding> {
  // Setting up the default user to use in the sign up process
  final newUser = User(
    resources: [],
    conversations: [],
    buds: [],
    activities: [],
    activitiesEnjoyed: [],
  );

  // Build Process - Everything in here is rendered everytime app reloads
  @override
  Widget build(BuildContext context) {
    // Scaffold to make up the main part of the onboarding page
    return Scaffold(
      backgroundColor: Colors.white,
      body: retrieveBody(),
    );
  }

  // Retrieve Body for the onboarding view
  Widget retrieveBody() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          retreivingCircularGymbudLogo(),
          ...retrieveOnboardingLoginSignupButtons(),
        ],
      ),
    );
  }

  Widget retreivingCircularGymbudLogo() {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(100),
        ),
      ),
      child: Image.asset('Resources/Images/logoGymbud.png'),
    );
  }

  List<Widget> retrieveOnboardingLoginSignupButtons() {
    return [
      ElevatedButton(
        child: Text(
          'Log in',
          style: GoogleFonts.delius(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 26,
          ),
        ),
        style: StyleVariableStore.login_btn_style,
        onPressed: () => {
          // Navigate to the Login Page upon Login Button Click
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            ),
          )
        },
      ),
      SizedBox(
        height: 20,
      ),
      ElevatedButton(
        child: Text(
          'Sign Up',
          style: GoogleFonts.delius(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 26,
          ),
        ),
        style: StyleVariableStore.sign_up_button_style,
        onPressed: () => {
          // Navigate to the Signup Page upon Signup Button Click and pass in new user default values
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BasicSignUp(user: newUser),
            ),
          )
        },
      ),
    ];
  }

  // End of the Onboarding Page Functions
}
