//Class Declaration of the Class Model

class User {
    String id, userName , password , profile_url, name , gender , dob , preferredIntensity, preferredAgeRange,videoOrInPerson, fitnessLevel;
    List resources , messages , matches , sessions;
    User(
    this.id,
    this.userName , 
    this.password , 
    this.profile_url,
    this.name , 
    this.gender, 
    this.dob , 
    this.preferredIntensity , 
    this.preferredAgeRange , 
    this.videoOrInPerson , 
    this.fitnessLevel , 
    this.matches , 
    this.sessions ,
    this.resources,
    this.messages 
  );
  
  User.register(
    this.userName , 
    this.password , 
    this.profile_url,
    this.name , 
    this.gender, 
    this.dob , 
    this.preferredIntensity , 
    this.preferredAgeRange , 
    this.videoOrInPerson , 
    this.fitnessLevel , 
    this.matches , 
    this.sessions ,
    this.resources,
    this.messages 
  );

  User.login(
    this.userName , 
    this.password , 
  );
  
  ///Constructor to pull json data values and make up a User model
  /// and return User to UserManager class to pass to page to be displayed
  User.fromJSON(Map<String, dynamic> data) {
    this.id = data["_id"];
    this.userName = data['userName'];
    this.password = data['password'];
    this.profile_url = data['Profile_Url'];
    this.name = data['Name'];
    this.gender = data["Gender"];
    this.dob = data["DOB"];
    this.preferredIntensity = data["Preferred_Intensity"];
    this.preferredAgeRange = data["Preferred_Age_Range"];
    this.videoOrInPerson = data["Video_Or_In_Person"];
    this.fitnessLevel = data["Fitness_Level"];
    this.matches = data["Matches"];
    this.sessions = data["Sessions"];
    this.resources = data["Resources"];
    this.messages = data["Messages"];
  }

  Map<String , dynamic> toJson() => {
    'userName': this.userName,
    'password': this.password,
    'Profile_Url': this.profile_url,
    'Name': this.name,
    'Gender': this.gender,
    'DOB': this.dob,
    'Preferred_Intensity': this.preferredIntensity,
    'Fitness_Level': this.fitnessLevel,
    'Resources': this.resources,
    'Preferred_Age_Range': this.preferredAgeRange,
    'Video_Or_In_Person': this.videoOrInPerson,
    'Messages': this.messages,
    'Matches': this.matches,
    'Sessions': this.sessions 
  };

}