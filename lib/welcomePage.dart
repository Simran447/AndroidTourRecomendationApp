import 'package:flutter/material.dart';
import 'package:travelapp/GetStartedScreen.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final heightOfScreen = MediaQuery.of(context).size.height;
    final widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 45, 25, 0),
                child: Image.asset(
                  'assets/travelslogo.png',
                  // height: 370,
                  width: 300,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Explore Your Journey \nOnly With Us',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
                'All Your Vacation Destinations Are Here, \nEnjoy Your Holidays',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.black54)),
            // const SizedBox(height: 34),
            const Spacer(),
            SizedBox(
              width: 240,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GetStartedScreen(),
                      ));
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: const StadiumBorder(),
                  backgroundColor: Colors.blue,
                ),
                // style: ButtonStyle(
                //     backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue),
                //   ),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
