import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:travelapp/UserMgnt.dart';
import 'package:travelapp/widgets/NearByPlaces.dart';
import 'package:travelapp/widgets/Recommended_places.dart';
import 'package:travelapp/widgets/custom_icons.dart';
import 'package:travelapp/widgets/location_card.dart';
import 'package:travelapp/widgets/tourist_places.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final heightOfScreen = MediaQuery.of(context).size.height;
    final widthOfScreen = MediaQuery.of(context).size.width;
    final usernameService = UsernameService();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Good Morning,'),
            //const DataFromDB(),
            FutureBuilder<String>(
              // Use FutureBuilder to display retrieved username
              future: usernameService.getUsername(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('...'); // Or a loading indicator
                }

                return Text(
                  snapshot.data ?? "", // Display username or empty string
                  style: Theme.of(context).textTheme.labelLarge,
                );
              },
            ),

            // Text(
            //   "",
            //   style: Theme.of(context).textTheme.labelLarge,
            // )
          ],
        ),
        actions: const [
          CustomIconButton(
            icon: Icon(Ionicons.search_outline),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12, right: 6),
            child: CustomIconButton(
              icon: Icon(Ionicons.notifications_outline),
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(5),
        children: [
          //LOCATION CARD
          const LocationCard(),

          const SizedBox(
            height: 15,
          ),
          //CATEGORIES
          const TouristPlaces(),

          const SizedBox(
            height: 10,
          ),
          //RECOMMENDATION
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Recommendation",
                  style: Theme.of(context).textTheme.titleLarge),
              TextButton(onPressed: () {}, child: const Text("View All"))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const RecommendedPlaces(),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Nearby From You",
                  style: Theme.of(context).textTheme.titleLarge),
              TextButton(onPressed: () {}, child: const Text("View All"))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const NearByPlaces(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Ionicons.home_outline), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Ionicons.bookmark_outline), label: 'Bookmark'),
          BottomNavigationBarItem(
              icon: Icon(Ionicons.ticket_outline), label: 'Ticket'),
          BottomNavigationBarItem(
              icon: Icon(Ionicons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }

  // _fetch() async {
  //   String userName;
  //   final firebaseuser = await FirebaseAuth.instance.currentUser?.uid;
  //   if (firebaseuser != null) {
  //     FirebaseFirestore.instance
  //         .collection("Users")
  //         .doc(firebaseuser)
  //         .get()
  //         .then((ds) {
  //       userName = ds.data() as String;
  //     });
  //   }
  // }
}
