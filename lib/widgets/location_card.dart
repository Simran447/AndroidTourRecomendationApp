import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                'assets/logo/maplogo.png',
                width: 65,
                height: 50,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Your Location',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Theme.of(context).primaryColor,
                        )),
                const SizedBox(
                  height: 3,
                ),
                Text('Nadiad, Gujrat',
                    style: Theme.of(context).textTheme.labelLarge!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
