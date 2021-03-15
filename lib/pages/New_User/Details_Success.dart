// Imports

// Library Imports
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

// Page Imports
import 'package:Client/Models/User.dart';
import 'package:Client/Helper_Widgets/ButtonProducer.dart';
import 'package:Client/Helper_Widgets/HexColor.dart';
import 'package:Client/pages/New_User/Activity_Details.dart';

class DetailsPageSuccess extends StatelessWidget {
  // This is the way we are going to save the values across the pages
  final User user;
  DetailsPageSuccess({Key key, @required this.user}) : super(key: key);

  // Template For Details Success Page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 180,
        leading: Container(
          child: Image.asset(
            'Resources/Images/logoGymbud.png',
          ),
        ),
        backgroundColor: HexColor("FEFEFE"),
      ),
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              width: 180,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              child: SvgPicture.asset(
                'Resources/Images/Activity_Preferences_Onboarding.svg',
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Column(
              children: [
                Text(
                  "Lets pick your \n activity preferences",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.meriendaOne(
                    color: HexColor("#000000"),
                    fontSize: 20,
                    // letterSpacing: -1.5,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60.0,
            ),
            createContinueToBasicDetailsPageBtn(context),
          ],
        ),
      ),
    );
  }

  // Create the button to navigate to the basic details page
  Widget createContinueToBasicDetailsPageBtn(BuildContext context) {
    return Container(
      width: 300,
      height: 60,
      child: ElevatedButton(
        style: ButtonProducer.getOrangeGymbudBtn(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ActivityDetails(user: user),
            ),
          );
        },
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "Continue",
            style: GoogleFonts.concertOne(
              fontSize: 30,
              // letterSpacing: -1.5,
            ),
          ),
        ),
      ),
    );
  }
}
