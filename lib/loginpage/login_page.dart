import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webkan/welcome_screen.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Future login(BuildContext cont) async {
    if(username.text == "" || password.text == ""){
      Fluttertoast.showToast(
          msg: "The user and password combination does not exist!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          /*timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,*/
          fontSize: 16.0
      );
    }


    var url = Uri.parse("https://www.developertest.cooo.in/class/login.php");
    var response = await http.post(url, body: {
      "username" : username.text,
      "password" : password.text,
    });

    var data = json.decode(response.body);
    if(data == "success"){
      Navigator.push(cont, MaterialPageRoute(builder: (context) => WelcomeScreen()));
    }else{
      Fluttertoast.showToast(
          msg: "The user and password combination does not exist!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body:  Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.orange.shade900,
                  Colors.orange.shade800,
                  Colors.orange.shade400
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 90,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Text("Login", style: TextStyle(color: Colors.white, fontSize: 40),),
                  SizedBox(height: 10,),
                  Text("Welcome Back", style: TextStyle(color: Colors.white, fontSize: 18),),
                ],
              ),
            ),
             SizedBox(height: 15,),
             Expanded(
                 child: Container(
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                   ),
                   child: Padding(
                     padding: EdgeInsets.all(30),
                     child: Column(
                       children: <Widget>[
                         SizedBox(height: 60,),
                         Container(
                           padding: EdgeInsets.all(20),
                           decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(10),
                             boxShadow: [BoxShadow(
                               color: Color.fromRGBO(225, 95, 27, 3),
                               blurRadius: 20,
                               offset: Offset(0, 10)
                             )]
                           ),
                           child: Column(
                             children: <Widget>[
                               Container(
                                 padding: EdgeInsets.all(10),
                                 decoration: BoxDecoration(
                                   border: Border(
                                       bottom: BorderSide(
                                           color: Colors.grey.shade200
                                       )
                                   )
                                 ),
                                 child: TextField(
                                   controller: username,
                                   decoration: InputDecoration(
                                     hintText: "Enter User Id",
                                     hintStyle: TextStyle(color: Colors.grey),
                                     border: InputBorder.none
                                   ),
                                 ),
                               ),
                               Container(
                                 padding: EdgeInsets.all(10),
                                 decoration: BoxDecoration(
                                     border: Border(
                                         bottom: BorderSide(
                                             color: Colors.grey.shade200
                                         )
                                     )
                                 ),
                                 child: TextField(
                                   controller: password,
                                   obscureText: true,
                                   decoration: InputDecoration(
                                       hintText: "Enter Password",
                                       hintStyle: TextStyle(color: Colors.grey),
                                       border: InputBorder.none
                                   ),
                                 ),
                               ),
                             ],
                           ),
                         ),
                         /*SizedBox(height: 40,),
                         Text('Forgot Password?', style: TextStyle(color: Colors.grey),),*/
                         SizedBox(height: 40,),
                          ButtonTheme(
                           minWidth: 200.0,
                           height: 50.0,
                           child: ElevatedButton(
                             style: ElevatedButton.styleFrom(
                               backgroundColor: Colors.orange.shade900,
                             ),
                             onPressed: () {
                               login(context);
                             },

                             child: Center(
                               child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                             ),
                           ),
                         ),
                         /*Container(
                           height: 50,
                           margin: EdgeInsets.symmetric(horizontal: 50),
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(50),
                             color: Colors.orange.shade900
                           ),
                           child: Center(
                             child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                           ),
                         ),*/
                       ],
                     ),
                   ),
                 ),


             ),

          ],
        ),
      ),
    );


  }
}
