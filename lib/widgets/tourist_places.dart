import 'package:flutter/material.dart';
import 'package:travelapp/models/tourist_palces_models.dart';

class TouristPlaces extends StatelessWidget {
  const TouristPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 1,
      child: ListView.separated(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Chip(
                label: Text(
                  touristPlaces[index].name,
                  style: TextStyle(fontSize: 14),
                ),
                avatar: CircleAvatar(
                  backgroundImage: AssetImage(
                    touristPlaces[index].image,
                  ),
                ),
                backgroundColor: Colors.white,
                elevation: 0.4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Color.fromARGB(31, 20, 20, 20))));
          },
          separatorBuilder: (context, index) =>
              const Padding(padding: EdgeInsets.only(left: 8)),
          itemCount: touristPlaces.length),
    );
  }
}
