import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:travelapp/models/RecommendedPlacesModel.dart';

class RecommendedPlaces extends StatelessWidget {
  const RecommendedPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 235,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return SizedBox(
                width: 220,
                child: Card(
                  elevation: 0.4,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              recommended[index].image,
                              width: double.maxFinite,
                              fit: BoxFit.cover,
                              height: 150,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                recommended[index].text,
                                style: const TextStyle(
                                  fontFamily: "RinkuFont",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              Icon(
                                Icons.star,
                                color: Colors.yellow.shade700,
                                size: 14,
                              ),
                              Text(
                                recommended[index].rating,
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(
                                Ionicons.location,
                                color: Theme.of(context).primaryColor,
                                size: 16,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                recommended[index].location,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ));
          }),
          separatorBuilder: (context, index) =>
              const Padding(padding: EdgeInsets.only(right: 10)),
          itemCount: recommended.length),
    );
  }
}
