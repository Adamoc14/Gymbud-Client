import 'package:Client/Models/User.dart';
import 'package:Client/Helper_Widgets/hex_color.dart';
import 'package:flutter/material.dart';

import 'Session_Details.dart';

class DetailsPageSuccess extends StatelessWidget {
  final User user;

  // We are going to instantiate a NewTripLocation with a required Trip instance
  // This is the way we are going to save the values across the pages
  DetailsPageSuccess({Key key, @required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
            title: Image.asset(
              "Resources/Images/logoGymbud.png",
              height: 100.0,
              width: 100.0
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
                child: Image.asset('Resources/Images/SessionSVGS.png')
            ),
            Column(
              children: [
                Text("Lets pick your session preferences")
              ]
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              child: Text('Continue'),
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) =>
                  SessionDetails(user: user)),
                ),
              },
            )
          ],
        ),
      ),
    );
  }
}