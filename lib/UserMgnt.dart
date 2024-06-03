import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UsernameService {
  final databaseInstance = FirebaseFirestore.instance;
  final authInstance = FirebaseAuth.instance;

  Future<String> getUsername() async {
    if (authInstance.currentUser != null) {
      final String currentUserId = authInstance.currentUser!.uid;
      final docSnapshot =
          await databaseInstance.collection("Users").doc(currentUserId).get();

      if (docSnapshot.exists) {
        final userData = docSnapshot.data()!;
        final username = userData['userName'];
        return username;
      } else {
        // Handle the case where the user document doesn't exist
        print("User document does not exist");
        return ""; // Or return a default value if needed
      }
    } else {
      // Handle the case where the user is not signed in
      print("User is not signed in");
      return ""; // Or return a default value if needed
    }
  }
}
