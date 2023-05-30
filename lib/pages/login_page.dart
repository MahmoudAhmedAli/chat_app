import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/pages/chat_apppage.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:chat_app/widgets/constants.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
   LoginPage({Key? key}) : super(key: key);
 static String id="loginpage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 bool isloadig=false;
 String? email;
 String?password;


 GlobalKey<FormState> formKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloadig,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
             key: formKey,
            child: ListView(
              children: [
                SizedBox(height: 75,),
                Image.asset('assets/images/scholar.png',
                height: 130,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Scholar Chat',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily:'pacifico'
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('LOGIN',
                      // textAlign: TextAlign.left,
                       style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,


                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                CustomTextField(

                  onchange: (data){
                    email=data;
                  },
                  hinttext: 'Email',
                ),
                SizedBox(height: 20,),
                CustomTextField(
                  obscretext: true,
                  
                  onchange: (data){
                    password=data;
                  },
                  hinttext: 'Password',
                ),
                SizedBox(height: 20,),
                CustomButton(
                  onTap: () async{
                    if (formKey.currentState!.validate()) {
                      isloadig=true;
                      setState(() {

                      });
                      try {
                        await loginUser();
                        showSnachBar(context, 'success');
                        Navigator.pushNamed(context, ChatPage.id, arguments:email );
                      }on FirebaseAuthException catch (ex) {
                        if(ex.code=='user-not-found'){
                          showSnachBar(context,'No user found for that email.');
                        }else if(ex.code == 'wrong-password'){
                          showSnachBar(context, 'Wrong password provided for that user');
                        }else{
                          showSnachBar(context, 'please enter email is correct');

                        }
                      } catch (e) {
                        showSnachBar(context, e.toString());
                      }
                      isloadig=false;
                      setState(() {

                      });

                    }else{
                      isloadig=false;
                      setState(() {

                      });
                    }
                  },
                  text: 'LOGIN',
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('dont\'t have an account? ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, RegisterPage.id);
                      },
                      child: Text(' Register',
                        style: TextStyle(
                          color: Color(0xffc7EDE6),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

 Future<void> loginUser() async {
   var auth = FirebaseAuth.instance;
   UserCredential user =
   await auth.signInWithEmailAndPassword(
       email:email! , password: password!);
 }
}
