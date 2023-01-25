import 'dart:ui';

import 'package:document_scanner_flutter_example/page1.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }

}
class LoginState extends State<Login>{

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  // decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //         // image: AssetImage('assets/images/background.png'),
                  //         fit: BoxFit.fill
                  //     )
                  // ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Center(
                            child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10)
                              )
                            ]
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey))
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Nom d'utilisateur",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                                controller: username,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Mot de passe",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                                controller: password,
                                obscureText: true,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(143, 148, 251, 1),
                                  Color.fromRGBO(143, 148, 251, .6),
                                ]
                            )
                        ),
                        child: TextButton(
                          child: Text("Se connecter", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          onPressed:(){

                            String a="Nathan";
                            String b="405522";

                            if(username.text==a && password.text==b){
                              Navigator.pushAndRemoveUntil<dynamic>(
                                  context,
                                  MaterialPageRoute<dynamic>(
                                      builder: (BuildContext context)=> Page1()),
                                      (route) => false);
                            }else{
                              popUpContact(context);
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 30,),
                      Text("Mot de passe Oublie?",
                        style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

  popUpContact(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Verifier votre username or password",
              style: TextStyle(
                  color: Colors.red, fontSize: 14.0, fontWeight: FontWeight.bold)),
          actions: <Widget>[
            /* SizedBox(height: 15.0),
            Text("Verifier votre username or password",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold)),*/
            SizedBox(height: 3.0),
            FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}