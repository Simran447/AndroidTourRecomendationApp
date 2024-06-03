import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = true;
  bool progressBar = false;
  late String userName, emailAddress, password;
  final authInstance = FirebaseAuth.instance;
  final databaseInstance = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
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
                        "Login",
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
                      await authInstance.signInWithEmailAndPassword(
                          email: emailAddress, password: password);

                      Fluttertoast.showToast(
                          msg: "Login Successfully",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0);

                      setState(() {
                        progressBar = false;
                      });

                      Navigator.pushNamed(context, "/homescreen");
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
                    "Login",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                RawMaterialButton(
                  onPressed: () async {
                    await authInstance.sendPasswordResetEmail(
                        email: emailAddress);
                    Fluttertoast.showToast(
                        msg: "Password reset email sent Successfully",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: Text(
                      "Forgot Password !",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
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
