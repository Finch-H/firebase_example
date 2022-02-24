// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_example/animation/animations.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../config.dart';
import '../main.dart';
import '../progressdialog.dart';
import 'login_screen.dart';

class SignUPScreen extends StatefulWidget {
  SignUPScreen({Key key}) : super(key: key);
  static const String idScreen = "signUP";

  @override
  State<SignUPScreen> createState() => _SignUPScreenState();
}

class _SignUPScreenState extends State<SignUPScreen> {
  User firebaseUser;

//Users userCurrentInfo;

  User currentfirebaseUser;

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  final feature = ["Login", "Sign Up"];
  String _email, _password, _fullName, _mobileNumber;
  int i = 1;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height;
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            backgroundColor: Color(0xfffdfdfdf),
            body: i == 1
                ? SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(25),
                    child: Column(
                      children: [
                        // TabBar Code
                        Row(children: [
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
                              // child: Container(
                              //   width: 60,
                              //   height: 60,
                              //   color: Colors.red[400],
                              //   child: i == 0
                              //       ? Image(
                              //           image: NetworkImage(
                              //               "https://i.pinimg.com/564x/5d/a3/d2/5da3d22d08e353184ca357db7800e9f5.jpg"),
                              //         )
                              //       : Icon(
                              //           Icons.account_circle_outlined,
                              //           color: Colors.white,
                              //           size: 40,
                              //         ),
                              // ),
                            ),
                          ),
                        ]),

                        SizedBox(
                          height: 30,
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
                                RichText(
                                  text: TextSpan(
                                    text: "Hello ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  "Enter your informations below or \nlogin with a social account",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          height: height / 18,
                        ),

                        // TextFiled
                        Container(
                          width: width / 1.2,
                          height: height / 2.55,
                          child: TopAnime(
                            1,
                            16,
                            curve: Curves.easeInExpo,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  TextField(
                                      onChanged: (value) {
                                        _fullName = value;
                                      },
                                      controller:
                                      nameTextEditingController,
                                      // readOnly: true, // * Just for Debug
                                      cursorColor: Colors.black,
                                      style:
                                      TextStyle(color: Colors.black),
                                      showCursor: true,
                                      //cursorColor: mainColor,
                                      decoration: InputDecoration(
                                          labelText: "FullName")),
                                  SizedBox(
                                    height: 25,
                                  ),

                                  TextField(
                                    onChanged: (value) {
                                      _email = value;
                                    },
                                    controller:
                                    emailTextEditingController,

                                    maxLines: 1,
                                    decoration: const InputDecoration(
                                      labelText: " E-mail",
                                      border: InputBorder.none,
                                    ),
                                    // readOnly: true, // * Just for Debug
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black),
                                    showCursor: true,
                                    //cursorColor: mainColor,
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),

                                  TextField(
                                      onChanged: (value) {
                                        _password = value;
                                      },
                                      controller:
                                      passwordTextEditingController,
                                      obscureText: true,

                                      // readOnly: true, // * Just for Debug
                                      cursorColor: Colors.black,
                                      style:
                                      TextStyle(color: Colors.black),
                                      showCursor: true,
                                      //cursorColor: mainColor,
                                      decoration: InputDecoration(
                                          labelText: "Password")),
                                  SizedBox(
                                    height: 25,
                                  ),

                                  SizedBox(
                                    height: 5,
                                  ),

                                  // FaceBook and Google ICon
                                  TopAnime(
                                    1,
                                    11,
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
                        ),
                      ],
                    ),
                  ),

                  // Bottom
                  i == 1
                      ? TopAnime(
                    2,
                    29,
                    curve: Curves.fastOutSlowIn,
                    child: Container(
                      height: height / 6,
                      // color: Colors.red,
                      child: Stack(
                        children: [
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

                              onTap: () async {
                                if (nameTextEditingController
                                    .text.length <
                                    0) {
                                  displayToast(
                                      "Name must be atleast 3 characters.",
                                      context);
                                } else if (!emailTextEditingController
                                    .text
                                    .contains("@")) {
                                  displayToast(
                                      "Email address is not Valid",
                                      context);
                                } else if (passwordTextEditingController
                                    .text.length <
                                    6) {
                                  displayToast(
                                      "Password must be atleast 6 Characters",
                                      context);
                                } else {
                                  Future.wait([registerNewUser(context),
                                    registerinfirestore(context)]);
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             LoginScreen()));
                                }
                              },


                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xffEB5757),
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
                      : LoginScreen()
                ],
              ),
            )
                : LoginScreen()),
      ),
    );
  }

  Future<void> registerinfirestore(BuildContext context) async {
    // UserCredential user = await FirebaseAuth.instance
    //     .createUserWithEmailAndPassword(
    //         email: _email.trim(), password: _password.trim());
    // if (user != null) {
    await FirebaseFirestore.instance.collection('Users').doc(_email).set({
      'FullName': _fullName,
      'Email': _email,
    });
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) {
    //     return LoginScreen();
    //   }),
    //);
  }


  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> registerNewUser(BuildContext context) async {
    // UserCredential user= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email.trim(), password: _password.trim());
    // if(user!=null)
    // {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ProgressDialog(
            message: "Registering,Please wait.....",
          );
        });

    firebaseUser = (await _firebaseAuth
        .createUserWithEmailAndPassword(
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text)
        .catchError((errMsg) {
      Navigator.pop(context);
      displayToast("Error" + errMsg.toString(), context);
    }))
        .user;

    if (firebaseUser != null) // user created

        {
      //save use into to database

      Map userDataMap = {
        "name": nameTextEditingController.text.trim(),
        "email": emailTextEditingController.text.trim(),
      };
      Users.child(firebaseUser.uid).set(userDataMap);

      currentfirebaseUser = firebaseUser;

      displayToast("Congratulation, your account has been created", context);

      Navigator.pushNamed(context, LoginScreen.idScreen);
    } else {
      Navigator.pop(context);
      //error occured - display error
      displayToast("user has not been created", context);
    }
  }


  displayToast(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}