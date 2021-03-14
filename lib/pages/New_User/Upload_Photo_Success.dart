// Imports

// Library Imports
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

// Page Imports
import 'package:Client/Helper_Widgets/ButtonProducer.dart';
import 'package:Client/pages/New_User/Details_Page.dart';
import 'package:Client/Models/User.dart';
import 'package:Client/Helper_Widgets/HexColor.dart';

// Upload Profile Pic Success Page
class UploadPhotoSucess extends StatefulWidget {
  /*  
    Setting up variables for this page
   */

  // User object to be required to transfer values across pages
  final User user;
  UploadPhotoSucess({Key key, @required this.user}) : super(key: key);

  @override
  _UploadPhotoState createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhotoSucess> {
  /*  
    Setting up variables for this page
   */

  // File and image picker necessary for this page
  File _image;
  final picker = ImagePicker();

  // Logic Functions

  Future getImageFromSource(ImageSource imgSource) async {
    final pickedImage = await picker.getImage(source: imgSource);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    } else {
      print("No image selected");
    }
  }

  // dealWithUploadImageBtnClick(BuildContext context) async {
  //   try {
  //     await ImageUploader.upload(_image);
  //   } catch (e) {
  //     print('caught error $e');
  //   }
  // }

  // UI Functions

  @override
  Widget build(BuildContext context) {
    // Scaffold to make up the main part of the upload profile pic page
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
      body: retrieveBody(),
    );
  }

  Widget retrieveBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: 580,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    // onTap: () => {
                    //   getImageFromSource(ImageSource.gallery),
                    // },
                    child: Container(
                      width: 240,
                      height: 240,
                      padding: widget.user.profileUrl == null
                          ? EdgeInsets.all(5)
                          : null,
                      color: Colors.black12,
                      child: widget.user.profileUrl == null
                          ? Icon(Icons.add)
                          : Image.network(
                              widget.user.profileUrl,
                              fit: BoxFit.fill,
                            ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: widget.user.profileUrl == null
                        ? Text("No image Selected. Please pick one to continue")
                        : Text(
                            "That’s Perfect 👌 \n On We GO!!",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.meriendaOne(
                              color: HexColor("#000000"),
                              fontSize: 15,
                              // letterSpacing: -1.5,
                            ),
                          ),
                  ),
                ),
              ),
              if (widget.user.profileUrl != null)
                GestureDetector(
                  onTap: () async {},
                  child: createContinueToBasicDetailsPageBtn(context),
                )
            ],
          ),
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
              builder: (context) => DetailsPage(
                user: widget.user,
              ),
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
