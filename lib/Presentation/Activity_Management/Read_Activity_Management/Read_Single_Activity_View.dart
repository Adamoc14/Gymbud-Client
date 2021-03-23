// Imports

// Library Imports
import 'package:Client/Config/configVariables.dart';
import 'package:Client/Helpers/GeneralHelperMethodManager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Page Imports
import 'package:Client/Helpers/HexColor.dart';
import 'package:Client/Infrastructure/Models/InformationPopUp.dart';
import 'package:Client/Infrastructure/Models/Activity.dart';
import 'package:Client/Infrastructure/Models/User.dart';
import 'package:Client/Managers/Providers.dart';
// import 'package:Client/pages/ProfilePage.dart';

class SingleActivityView extends StatefulWidget {
  final Activity activity;
  final User user;

  SingleActivityView({Key key, @required this.activity, this.user})
      : super(key: key);

  @override
  _SingleActivityViewState createState() => _SingleActivityViewState();
}

class _SingleActivityViewState extends State<SingleActivityView> {
  InformationPopUp infoPopUp;

  GeneralHelperMethodManager generalHelperMethodManager =
      GeneralHelperMethodManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          height: 70,
          padding: const EdgeInsets.all(0),
          child: Row(children: [
            Expanded(
              flex: 6,
              child: Image.asset(
                'Resources/Images/logoGymbud.png',
                fit: BoxFit.fill,
              ),
            ),
          ]),
        ),
        backgroundColor: HexColor("FEFEFE"),
      ),
      body: getSingleActivityBody(),
    );
  }

  List<Widget> getAttendeeCircles() {
    List<Widget> widgetList = [];
    for (var user in widget.activity.participants) {
      widgetList.add(
        CircleAvatar(
          backgroundImage: NetworkImage(user.profileUrl),
        ),
      );
    }
    widgetList.add(Container());
    return widgetList;
  }

  void addUserToActivity(activityId, userId, BuildContext context) async {
    // Obtain all activities of the user and check before signing user up again
    List<bool> checkSignedUpAlready = context
        .read(user_notifier_provider.state)
        .activities
        .map((activity) => activityId == activity?.id);
    if (checkSignedUpAlready.contains(true)) {
      // TODO: Show Error Message saying they've already signed up
      return;
    }

    // Check to see if activity is full with people
    int isFull = await context
        .read(activity_notifier_provider.state)
        .participants
        .length;
    if (isFull == 2) {
      // Make A Conversation between the two involved in the activity
      List<User> participants =
          context.read(activity_notifier_provider.state).participants;
      String receiverId = participants[0].id;
      await context
          .read(conversations_provider)
          .createConversation(userId, receiverId, []);

      // Create a Video Link and attach it to the activity if it's a home or gym workout
      String newVideoUrl = await context.read(video_provider).createVideoLink();
      // await context.read(activity_notifier_provider.state).activityVideoUrl = newVideoUrl;

      // TODO: Show Error Message saying that particular activity is full
      return;
    }

    Activity isSignedUpActivity = await context
        .read(activities_provider)
        .addUserToActivity(activityId, userId);
    if (isSignedUpActivity.runtimeType == Activity) {
      //TODO: Take away the activity they signed up for from the temporary activities

      // Update the user's logged in activities and add one created
      context
          .read(user_notifier_provider.state)
          .activities
          .add(isSignedUpActivity);

      // BBring them back a page in the app
      Navigator.pop(context);
    }
  }

  Widget getSingleActivityBody() {
    return SingleChildScrollView(
      child: Container(
          height: 1280,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 470,
                child: Hero(
                  tag: 'Activity ${widget.activity.hashCode}',
                  child: Image.network(
                    widget.activity.activityImageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 3),
                padding: EdgeInsets.all(6),
                height: 800,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 80,
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Name",
                                style: GoogleFonts.meriendaOne(
                                  color: HexColor("#000000"),
                                  fontSize: 18,
                                  letterSpacing: -1.5,
                                ),
                              ),
                              Text(widget.activity.activityName),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Type Of Workout",
                                style: GoogleFonts.meriendaOne(
                                  color: HexColor("#000000"),
                                  fontSize: 18,
                                  letterSpacing: -1.5,
                                ),
                              ),
                              Text(widget.activity.activityType),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Looking To Workout With",
                                style: GoogleFonts.meriendaOne(
                                  color: HexColor("#000000"),
                                  fontSize: 18,
                                  letterSpacing: -1.5,
                                ),
                              ),
                              Text(widget.activity.activityGenderPreference),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Text("Activity"),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                width: 250,
                                height: 70,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 8.0,
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  // border: Border.all(
                                  //   color:
                                  //       HexColor('#eeeeee'), // set border color
                                  //   width: 1.0,
                                  // ),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(
                                            top: 4, right: 4, left: 4),
                                        width: 230,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: HexColor('#F1BF60'),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                                child: Icon(Icons.date_range)),
//                                           SizedBox(width: 15.0),
                                            Expanded(
                                              child: Text(
                                                "Activity Details",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                    Container(
                                        width: 230,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                '${widget.activity.date}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
//                                           SizedBox(width: 15.0),
                                            Expanded(
                                              child: Text(
                                                '${widget.activity.time}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: GoogleFonts.meriendaOne(
                                      color: HexColor("#000000"),
                                      fontSize: 18,
                                      letterSpacing: -1.5,
                                    ),
                                    children: [
                                      TextSpan(text: 'Participants'),
                                      WidgetSpan(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20.0),
                                          child: Icon(Icons.person),
                                        ),
                                      ),
                                      TextSpan(
                                          text:
                                              '${widget.activity.participants.length}'),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: getAttendeeCircles(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Resources",
                                style: GoogleFonts.meriendaOne(
                                  color: HexColor("#000000"),
                                  fontSize: 18,
                                  letterSpacing: -1.5,
                                ),
                              ),
                              Row(
                                children: widget.activity.resources
                                    .map((resource) => Text(resource))
                                    .toList(),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          style: update_btn_style,
                          onPressed: () => {
                            addUserToActivity(
                                widget.activity.id,
                                context.read(user_notifier_provider.state).id,
                                context),
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "I want to do this/I'm Available",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

//https://www.youtube.com/watch?v=ZVznzY7EjuY
// Documentation for How I made the Zoom Clone
