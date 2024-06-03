import 'package:flutter/material.dart';
import 'package:travelapp/models/NearByPlacesModel.dart';
import 'package:travelapp/models/RecommendedPlacesModel.dart';
import 'package:travelapp/widgets/Distance.dart';

class NearByPlaces extends StatelessWidget {
  const NearByPlaces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween, // Uncomment for spacing
      children: List.generate(recommended.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: SizedBox(
            height: 135,
            width: double.maxFinite,
            child: Card(
              elevation: 0.4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          nearPlaces[index].image,
                          height: double.maxFinite,
                          width: 130,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              nearPlaces[index].name,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontFamily: "RinkuFont",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              nearPlaces[index].location,
                              textAlign: TextAlign.right,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Distance(),
                            const Spacer(),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow.shade700,
                                  size: 14,
                                ),
                                Text(
                                  nearPlaces[index].Rating,
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                const Spacer(),
                                RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        text: nearPlaces[index].price,
                                        children: const [
                                      TextSpan(
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black),
                                          text: "/ Person")
                                    ]))
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
