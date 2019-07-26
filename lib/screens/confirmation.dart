import 'package:flutter/material.dart';
import 'package:testflutter/components/rounded_button.dart';
import 'package:testflutter/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flushbar/flushbar.dart';
import 'package:testflutter/screens/success.dart';
import 'package:testflutter/utils/network.dart';

class ConfirmationScreen extends StatefulWidget {
 
  @override
  _ConfirmationScreenState createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  String errorMessage = 'An error occurred';
  TextStyle errorStyle;
  String name;
  String email;
  bool showSpinner = false;
  final messageTextController = TextEditingController();
  final messageTextControllerTwo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFE8C870),
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  
                  SizedBox(
                    height: 48.0,
                  ),
                  TextField(
                    controller: messageTextController,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      name = value;
                    },
                    decoration: KTextFieldDecoration.copyWith(
                      hintText: 'Name',
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    controller: messageTextControllerTwo,
                    
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: KTextFieldDecoration.copyWith(
                      hintText: 'Email',
                      
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  RoundedButton(
                      title: 'Confirm',
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
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Welcome(),),);


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
                  
                ],
              ),
            ),
          ),
        ));
  }
}
