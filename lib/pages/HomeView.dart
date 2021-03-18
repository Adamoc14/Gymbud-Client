import 'package:Client/Helper_Widgets/HexColor.dart';
import 'package:Client/Models/User.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  // List<User> users = List<User>();
  // HomeView({Key key, @required this.users}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<User> users = [];

  // void setupUsers() async {
  //   UserController userController = new UserController();
  //   userController.getUsers().then((user) => setState(() {
  //         users.addAll(user);
  //       }));
  // }

  @override
  void initState() {
    super.initState();
    // setupUsers();
    // this._tabPages = [
    //   HomeView(users: users),
    //   MatchView(),
    //   CalendarView()
    // ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          child: Container(
            color: Colors.white,
            height: 50,
            child: Center(
              child: Text("Past Users / Activities"),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            users[index].name,
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 15.0),
                            child: Text(
                              users[index].username,
                              style: TextStyle(color: HexColor("EB9661")),
                            ),
                          ),
                          Text(
                            "Preferred Intensity: " +
                                users[index].preferredIntensity,
                          ),
                          Text(
                            "Fitness Level: " + users[index].fitnessLevel,
                          ),
                          Text(
                            "Resources: " + users[index].resources.toString(),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 50.0,
                          backgroundImage: users[index].profileUrl != null
                              ? new NetworkImage(users[index].profileUrl)
                              : null,
                          backgroundColor: Colors.transparent,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: users.length,
          ),
        ),
      ],
    );
  }
}
