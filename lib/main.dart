import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_example/screens/login_screen.dart';
import 'package:firebase_example/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Example',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
        debugShowCheckedModeBanner: false,

        home: LoginScreen(),

    //   initialRoute: FirebaseAuth.instance.currentUser == null
    // ? SignUPScreen.idScreen
    //     : homepage.idScreen,
    routes: {
      SignUPScreen.idScreen: (context) => SignUPScreen(),
      LoginScreen.idScreen: (context) => LoginScreen(),
    }
    );
      }

  }

