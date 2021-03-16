// Imports

// Library Imports

// Page Impports
import 'package:Client/Controllers/MessageController.dart';
import 'package:Client/Models/Message.dart';
import 'package:Client/Models/User.dart';

class Conversation {
  // String variable to gather the id which is very important
  String id;

  // Variable to hold the amount of messages going to be in each conversation
  List<dynamic> messages = [];

  // Variable to hold the Sender and Reciever Message Objects
  User receiver;
  User sender;

  // Optional Named Constructor for Conversation
  Conversation({this.messages, this.receiver, this.sender});

  // Constructor to pull json data values and make up a Conversation model
  Conversation.fromJSON(Map<String, dynamic> data) {
    this.id = data["_id"];
    this.messages = data['Messages'];
    // this.messages = MessageController.decodeMessageStringToMessageList(
    //     data['Messages'].toString());
    this.receiver = User.fromJSON(data["Receiver"]);
    this.sender = User.fromJSON(data["Sender"]);
  }

  static Map<String, dynamic> toJson(Conversation conversation) => {
        '_id': conversation.id,
        'Messages': conversation.messages,
        'Receiver': User.toJson(conversation.receiver),
        'Sender': User.toJson(conversation.sender)
      };

  @override
  String toString() {
    return Conversation.toJson(this).toString();
  }
}
