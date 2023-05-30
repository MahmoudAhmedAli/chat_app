import 'package:chat_app/widgets/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Message{
  final String message;
  final String id;


  Message(this.message, this.id);

  factory Message.fromJson( jsondata){
    return Message(jsondata[kMessage],jsondata['id']);
  }
}