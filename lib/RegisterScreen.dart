// ignore_for_file: dead_code

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool showPassword = true;
  late String userName, emailAddress, password;
  final authInstance = FirebaseAuth.instance;
  bool progressBar = false;
  final databaseInstance = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    // final heightOfScreen = MediaQuery.of(context).size.height;
    // final widthOfScreen = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.chevron_left,
                      size: 30,
                      color: Colors.blue,
                    ),
                    // SizedBox(
                    //   width: widthOfScreen * 0.3,
                    // ),
                    Padding(
                      padding: EdgeInsets.only(right: 40, left: 100),
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontFamily: "RinkuFont",
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextField(
                    onChanged: (value) {
                      userName = value;
                    },
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      hintText: "Please Enter Your Username ",
                      suffixIcon: Icon(Icons.people),
                      filled: true,
                      fillColor: Colors.blue,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextField(
                    onChanged: (value) => emailAddress = value,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "Please Enter Your EmailID ",
                      suffixIcon: Icon(Icons.email),
                      filled: true,
                      fillColor: Colors.blue,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextField(
                    onChanged: (value) => password = value,
                    keyboardType: TextInputType.number,
                    obscureText: showPassword,
                    decoration: InputDecoration(
                      hintText: "Please Enter password",
                      filled: true,
                      fillColor: Colors.blue,
                      border: InputBorder.none,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        // Padding around the icon
                        child: Icon(
                          showPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                ),
                RawMaterialButton(
                  fillColor: Colors.blue,
                  onPressed: () async {
                    try {
                      setState(() {
                        progressBar = true;
                      });
                      await authInstance.createUserWithEmailAndPassword(
                          email: emailAddress, password: password);
                      Fluttertoast.showToast(
                          msg: "Registered Successfully",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0);

                      setState(() {
                        progressBar = false;
                      });
                      await databaseInstance
                          .collection("Users")
                          .doc(authInstance.currentUser?.uid)
                          .set({
                        "userName": userName.toString(),
                        "emailAddress": emailAddress.toString(),
                        "password": password.toString(),
                      });

                      Navigator.pushNamed(context, "/loginscreen");
                    } catch (error) {
                      Fluttertoast.showToast(
                          msg: error.toString(),
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      setState(() {
                        progressBar = false;
                      });
                    }
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
            progressBar
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Center(
                      child: LoadingAnimationWidget.dotsTriangle(
                          color: Colors.blue, size: 50),
                    ),
                  )
                : const SizedBox(
                    height: 100,
                  )
          ],
        ));
  }
}
