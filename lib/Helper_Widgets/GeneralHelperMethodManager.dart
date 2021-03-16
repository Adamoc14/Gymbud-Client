// Imports

// Library Imports
import 'dart:io';
import 'package:Client/Controllers/ConversationController.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Page Imports
import 'package:Client/Controllers/ActivityController.dart';
import 'package:Client/Controllers/UserController.dart';

// Class To upload Photos to the Backend
class GeneralHelperMethodManager {
  static storeValuesInPreferences(Map<String, List<dynamic>> dataList) async {
    // Setting up the app with a network manager and general helper manager
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encodedData = identifyValuesPassedIntoPreferences(
        dataList.keys.elementAt(0), dataList.values.elementAt(0));
    await prefs.setString(dataList.keys.elementAt(0), encodedData);
    print(encodedData);
    print(dataList);
    print(prefs);
  }

  static String identifyValuesPassedIntoPreferences(
      String object_identifier, List<dynamic> dynamicListValues) {
    switch (object_identifier) {
      case "users":
        return UserController.encodeUserListToUsersString(dynamicListValues);
      case "activities":
        return ActivityController.encodeActivityListToActivitiesString(
            dynamicListValues);
      case "conversations":
        return ConversationController
            .encodeConversationListToConversationsString(dynamicListValues);
    }
    return null;
  }
}
