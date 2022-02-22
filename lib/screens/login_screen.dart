// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_example/animation/animations.dart';
import 'package:firebase_example/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);
  static const String idScreen = "LoginScreen";
   String _email, _password;
  TextEditingController emailTextEditingController= TextEditingController();
  TextEditingController passwordTextEditingController= TextEditingController();
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final feature = ["Login", "Sign Up"];
  String _email, _password;
  TextEditingController emailTextEditingController= TextEditingController();
  TextEditingController passwordTextEditingController= TextEditingController();
  int i = 0;
  

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            backgroundColor: Color(0xfffdfdfdf),
            body: i == 0
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(25),
                          child: Column(
                            children: [



                              Row(
                                // TabBar Code
                                children: [
                                Container(
                                  height: height / 19,
                                  width: width / 2,
                                  child: TopAnime(
                                    2,
                                    5,
                                    child: ListView.builder(
                                      itemCount: feature.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              i = index;
                                            });
                                          },
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                child: Text(
                                                  feature[index],
                                                  style: TextStyle(
                                                    color: i == index
                                                        ? Colors.black
                                                        : Colors.grey,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              i == index
                                                  ? Container(
                                                      height: 3,
                                                      width: width / 9,
                                                      color: Colors.black,
                                                    )
                                                  : Container(),
                                            
                                            
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(child: Container()),






                                // Profile
                                RightAnime(
                                  1,
                                  15,
                                  curve: Curves.easeInOutQuad,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),

                                  ),
                                ),
                              ]),





                              SizedBox(
                                height: 50,
                              ),
                              



                              // Top Text
                              Container(
                                padding: EdgeInsets.only(left: 15),
                                width: width,
                                child: TopAnime(
                                  1,
                                  20,
                                  curve: Curves.fastOutSlowIn,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Welcome",
                                          style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.w300,
                                          )),
                                      Text(
                                        "",
                                        style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),



                              SizedBox(
                                height: height / 20,
                              ),




                              // TextFiled
                              Column(
                                children: [
                                  Container(
                                    width: width / 1.2,
                                    height: height / 3.10,
                                    //  color: Colors.red,
                                    child: TopAnime(
                                      1,
                                      15,
                                      curve: Curves.easeInExpo,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextField(
                                            controller: emailTextEditingController ,
                                            onChanged: (value) {
                                              _email=value;
                                            },
                                            // readOnly: true, // * Just for Debug
                                            cursorColor: Colors.black,
                                            style:
                                                TextStyle(color: Colors.black),
                                            showCursor: true,
                                            //cursorColor: mainColor,"
                                           decoration: InputDecoration(hintText: "Email"),
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          TextField(
                                              controller: passwordTextEditingController ,
                                              obscureText: true,
                                              onChanged: (value) {
                                                _password=value;
                                              },
                                              // readOnly: true, // * Just for Debug
                                              cursorColor: Colors.black,
                                              style: TextStyle(
                                                  color: Colors.black),
                                              showCursor: true,
                                              //cursorColor: mainColor,
                                              decoration:
                                                  InputDecoration
                                                      (
                                                          labelText:
                                                              "Password")),


                                          SizedBox(
                                            height: 5,
                                          ),



                                          // FaceBook and Google ICon
                                          TopAnime(
                                            1,
                                            10,
                                            child: Row(
                                              children: [
                                                IconButton(
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.facebookF,
                                                    size: 30,
                                                  ),
                                                  onPressed: () {},
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                IconButton(
                                                  icon: FaIcon(
                                                      FontAwesomeIcons
                                                          .googlePlusG,
                                                      size: 35),
                                                  onPressed: () {},
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),









                        // Bottom 
                        i == 0
                            ? TopAnime(
                                2,
                                42,
                                curve: Curves.fastOutSlowIn,
                                child: Container(
                                  height: height / 6,
                                  // color: Colors.red,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 30,
                                        top: 15,
                                        child: Text(
                                          "Fogot Password?",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 43),
                                        child: Container(
                                            height: height / 9,
                                            color:
                                                Colors.grey.withOpacity(0.4)),
                                      ),
                                      Positioned(
                                        left: 280,
                                        top: 10,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SignUPScreen()));
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Color(0xffF2C94C),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            width: width / 4,
                                            height: height / 12,
                                            child: Icon(
                                              Icons.arrow_forward,
                                              size: 35,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : SignUPScreen()
                      ],
                    ),
                  )
                : SignUPScreen()),
      ),
    );
  }
}
