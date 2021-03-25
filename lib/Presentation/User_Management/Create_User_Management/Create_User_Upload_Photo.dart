// Imports

// Library Imports
import 'package:Client/Config/configVariables.dart';
import 'package:Client/Helpers/GeneralHelperMethodManager.dart';
import 'package:Client/Helpers/HexColor.dart';
import 'package:Client/Managers/Providers.dart';
import 'package:Client/Presentation/User_Management/Create_User_Management/Create_User_Upload_Photo_Success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Page Imports
import 'package:Client/Infrastructure/Models/User.dart';
import 'package:Client/Helpers/ButtonProducer.dart';

// Upload Profile Pic Page
class UploadPhoto extends StatefulWidget {
  /*  
    Setting up variables for this page
   */

  // User object to be required to transfer values across pages
  UploadPhoto({Key key, @required this.user}) : super(key: key);
  final User user;

  @override
  _UploadPhotoState createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  // Logic Functions

  // UI Functions

  @override
  Widget build(BuildContext context) {
    final generalHelperMethodManager = GeneralHelperMethodManager(
        logged_in_user: widget.user, context: context);

    Widget retreiveBody(BuildContext context) {
      return SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Container(
            height: 580,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Lets Get You Started",
                  style: GoogleFonts.delius(
                    color: HexColor("#000000"),
                    fontSize: 24,
                    letterSpacing: -1.5,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: SvgPicture.asset(
                    'Resources/Images/Camera_Icon_Scan_Page.svg',
                  ),
                ),
                Text(
                  "Tap Button below please",
                  style: GoogleFonts.meriendaOne(
                    color: HexColor("#000000"),
                    fontSize: 15,
                    // letterSpacing: -1.5,
                  ),
                ),
                Container(
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        child: Text('Take Photo'),
                        style: StyleVariableStore.upload_pic_btn_style,
                        onPressed: () async {
                          await generalHelperMethodManager.getImageFromSource(
                              ImageSource.camera,
                              place: "User");
                          // imageUrl = await context
                          //     .read(image_provider)
                          //     .uploadImage(imageUrl);
                          // widget.user.profileUrl = imageUrl;
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => UploadPhotoSucess()));
                        },
                      ),
                      ElevatedButton(
                        child: Text('Upload Photo'),
                        style: StyleVariableStore.upload_pic_btn_style,
                        onPressed: () async {
                          await generalHelperMethodManager.getImageFromSource(
                              ImageSource.gallery,
                              place: "User");
                          // context.read(image_provider).uploadImage(imageUrl);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => UploadPhotoSucess()));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

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
        body: retreiveBody(context));
  }
}
