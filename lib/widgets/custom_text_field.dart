import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({this.onchange,required this.hinttext,this.obscretext=false});
String? hinttext;
Function(String)? onchange;
bool? obscretext;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      obscureText: obscretext!,

        style: TextStyle(color: Colors.pinkAccent), //<-- SEE HERE

      validator: (data){
          if(data!.isEmpty ){
            return 'field is required';
          }
      },
      onChanged: onchange,

      decoration: InputDecoration(

        hintText: hinttext,
        hintStyle : TextStyle(
          color: Colors.white,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,

          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
