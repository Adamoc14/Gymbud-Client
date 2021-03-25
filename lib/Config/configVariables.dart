// Imports

// Library Imports

// Page Imports
import 'package:Client/Helpers/ButtonProducer.dart';
import 'package:Client/Helpers/Libs_Required.dart';
import 'package:Client/Infrastructure/Models/InformationPopUp.dart';
import 'package:Client/Presentation/Activity_Management/Components/Activity_Option.dart';

// Activity Variables

class ActivityVariableStore {
  static List<GeneralOption> mainActivityOptions = [
    new GeneralOption("Home\n Workout", "Home_Workout",
        "Resources/Images/Home_Workout.svg", false),
    new GeneralOption("Gym \nWorkout", "Gym_Workout",
        "Resources/Images/GymWeights.svg", false),
    new GeneralOption("Outdoor\n Activity", "Outdoor_Activity",
        "Resources/Images/Outdoor_Act.svg", false)
  ];

  static List<GeneralOption> mainGenderOptions = [
    new GeneralOption("Male", "Male", "Resources/Images/Male.svg", false),
    new GeneralOption("Female", "Female", "Resources/Images/Female.svg", false),
    new GeneralOption("No Preference", "No_Preference",
        "Resources/Images/All_Gender.svg", false)
  ];

  static double defaultIntensity = 20.0;
  static double defaultActivityLevel = 20.0;
  static double defaultBudgetLevel = 10.0;
  static List<String> genderOptionsActivities = [
    "Male",
    "Female",
    "No Preference"
  ];

  // Variable to hold my activity preference modes slider string
  static Map<String, Map<double, String>> activityModesSliderStrings = {
    "Fitness": {
      0.0: "Inactive",
      20.0: "Slightly Active",
      40.0: "Moderately Active",
      60.0: "Active",
      80.0: "Very Active",
      100.0: "Super Active"
    },
    "Intensity": {
      0.0: "Not Intensive",
      20.0: "Slightly Intensive",
      40.0: "Moderately Intensive",
      60.0: "Intensive",
      80.0: "Very Intensive",
      100.0: "Super Intensive"
    },
    "Budget": {
      0.0: "Free",
      20.0: "Slightly Expensive",
      40.0: "Moderately Expensive",
      60.0: "Expensive",
      80.0: "Very Expensive",
      100.0: "Super Expensive"
    }
  };

  static Map<String, Map<String, double>> activityModesSliderDouble = {
    "Fitness": {
      "Inactive": 0.0,
      "Slightly Active": 20.0,
      "Moderately Active": 40.0,
      "Active": 60.0,
      "Very Active": 80.0,
      "Super Active": 100.0
    },
    "Intensity": {
      "Not Intensive": 0.0,
      "Slightly Intensive": 20.0,
      "Moderately Intensive": 40.0,
      "Intensive": 60.0,
      "Very Intensive": 80.0,
      "Super Intensive": 100.0
    },
    "Budget": {
      "Free": 0.0,
      "Slightly Expensive": 20.0,
      "Moderately Expensive": 40.0,
      "Expensive": 60.0,
      "Very Expensive": 80.0,
      "Super Expensive": 100.0
    }
  };

  // Array to hold the resources
  static List<String> resources = [
    "Bicycle",
    "Assault Bike",
    "Trap Bar",
    "Barbells",
    "Plates",
    "Bands",
    "Suspension Trainers",
    "Skipping Rope",
    "Treadmill",
    "Slam Ball",
    "Kettle Bells"
  ];

  // Array to hold the outdoor activities
  static List<String> activities = [
    "Swim",
    "Run",
    "Walk",
    "At Home Workout",
    "Gym",
    "Skip",
    "Hike",
    "Cycle"
  ];
}

// General Variables

class GeneralVariableStore {
  static double pageHeight = 1000;

  // Info  pop up to be used to alert user to a error within their input
  static InformationPopUp infoPopUp = new InformationPopUp();

  // Image picker necessary for this page
  static ImagePicker picker = ImagePicker();

  // Variable to hold all my drawerItems
  static List<Map> drawerItems = [
    {
      'icon': Icons.person,
      'title': 'Profile',
    },
    {
      'icon': SvgPicture.asset(
        "Resources/Images/Buds_Icon.svg",
        height: 30,
      ),
      'title': 'Buds',
      'type': 'SVG'
    },
    {
      'icon': SvgPicture.asset(
        "Resources/Images/Calendar_Icon.svg",
        height: 30,
      ),
      'title': 'Calendar',
      'type': 'SVG'
    },
    {
      'icon': Icons.mail,
      'title': 'Messages',
    },
    {
      'icon': Icons.favorite,
      'title': 'Favourites',
    },
    {
      'icon': Icons.add,
      'title': 'Gymbud Plus',
    },
  ];
}

// Styling Variables

class StyleVariableStore {
  static ButtonStyle update_btn_style = ButtonProducer.getOrangeGymbudBtn();
  static List<BoxShadow> shadowList = [
    BoxShadow(
      color: Colors.grey[300],
      blurRadius: 30,
      offset: Offset(10.0, 10.0),
      // offset: Offset(0, 10),
    )
  ];
  static ButtonStyle upload_pic_btn_style = ButtonProducer.getOrangeGymbudBtn();
}