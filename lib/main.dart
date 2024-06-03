import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp/LoginScreen.dart';
import 'package:travelapp/RegisterScreen.dart';
import 'package:travelapp/homePage.dart';
import 'package:travelapp/welcomePage.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const WelcomePage(),
        "/registerscreen": (context) => const RegisterScreen(),
        "/loginscreen": (context) => const LoginScreen(),
        "/homescreen": (context) => const HomePage(),
      },
      title: 'Travel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.mulishTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      // home: const WelcomePage(),
    );
  }
}
