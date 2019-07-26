import 'package:flutter/material.dart';
import 'package:testflutter/components/rounded_button.dart';
import 'package:testflutter/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flushbar/flushbar.dart';
import 'package:testflutter/screens/confirmation.dart';
import 'package:testflutter/utils/network.dart';

class LoginScreen extends StatefulWidget {
 
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String errorMessage = 'An error occurred';
  TextStyle errorStyle;
  String username;
  String password;
  bool showSpinner = false;
  final messageTextController = TextEditingController();
  final messageTextControllerTwo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFE8C870),
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 28.0,
                    ),
                    Center(
                      child: Text(
                        'Clockin',
                        style: TextStyle(
                            fontSize: 50.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,),
                            
                      ),
                    ),
                    SizedBox(
                      height: 28.0,
                    ),
                    Container(
                      height: 70.0,
                      child: Icon(Icons.watch),
                    ),
                    SizedBox(
                      height: 48.0,
                    ),
                    TextField(
                      controller: messageTextController,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        username = value;
                      },
                      decoration: KTextFieldDecoration.copyWith(
                        hintText: 'Enter your username',
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 5.0),

                          child: Icon(
                            Icons.person,
                            color: Colors.blueAccent,
                          ), // icon is 48px widget.
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    TextField(
                      controller: messageTextControllerTwo,
                      obscureText: true,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: KTextFieldDecoration.copyWith(
                        hintText: 'Enter your password',
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 5.0),

                          child: Icon(
                            Icons.lock,
                            color: Colors.blueAccent,
                          ), // icon is 48px widget.
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    RoundedButton(
                        title: 'Log In',
                        colour: Colors.blueAccent,
                        onPressed: () async {
                          setState(() {
                            showSpinner = true;
                          });

                          try {
                            //   ApiBaseHelper helper = ApiBaseHelper();

                            //   helper.post('', {email: email, password: password})

                            //   if (user != null) {

                            //         Navigator.pushNamed(context, NavScreen.id);

                            //     }
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ConfirmationScreen(),),);

                            setState(() {
                              showSpinner = false;
                            });
                          } catch (e) {
                            setState(() {
                              showSpinner = false;

                              if (e.message != null) {
                                messageTextController.clear();

                                messageTextControllerTwo.clear();

                                Flushbar(
                                  title: errorMessage,
                                  messageText: Text(
                                    e.message.toString(),
                                    style: TextStyle(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  flushbarStyle: FlushbarStyle.GROUNDED,
                                  icon: Icon(
                                    Icons.info_outline,
                                    size: 28.0,
                                    color: Colors.red[400],
                                  ),
                                  duration: Duration(seconds: 3),
                                  leftBarIndicatorColor: Colors.red[400],
                                )..show(context);
                              }
                            });
                          }
                        }),
                    SizedBox(
                      height: 78.0,
                    ),
                    FlatButton(
                      child: Center(
                        child: Text(
                          'Forgot account details?',
                          style: TextStyle(
                              fontSize: 16.0,
                              
                              color: Colors.blueAccent),
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
