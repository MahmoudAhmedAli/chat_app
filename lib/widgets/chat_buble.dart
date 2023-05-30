
import 'package:chat_app/models/messagemodel.dart';
import 'package:chat_app/widgets/constants.dart';
import 'package:flutter/material.dart';

class ChatBuble extends StatelessWidget {
   ChatBuble({
    Key? key,
     required this.message,
     required this.color,
  }) : super(key: key);
final Message message;
Color?color;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(

        padding: EdgeInsets.only(left: 16,top: 26,bottom:26,right: 32),
        margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          color: color,
        ),
        child: Text(message.message,

          style: TextStyle(
            color: Colors.white,

          ),
        ),

      ),
    );
  }
}

class ChatBubleForFriend extends StatelessWidget {
  ChatBubleForFriend({
    Key? key,
  required this.message1,
    required this.color1
  }) : super(key: key);

  final Message message1;
  Color?color1;


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(left: 16,top: 26,bottom:26,right: 32),
        margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
          color: color1,
        ),
        child: Text(message1.message,
          style: TextStyle(
            color: Colors.white,

          ),
        ),

      ),
    );
  }
}

