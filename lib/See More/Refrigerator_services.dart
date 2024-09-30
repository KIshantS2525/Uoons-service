import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uoons_services/ServiceCards.dart';

class RefrigeratorServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Refrigerator Services"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ServiceCard(
              title: 'Refrigerator Checkup',
              price: '₹160',
              time: '30 mins',
              description:
                  'Price covers diagnosis visit; spare parts are charged',
              imageUrl: 'assets/Refrigerator/checkup.webp',
              isCustomizable: true,
              customizationOptions: [
                "Single Door",
                "Double Door",
                "Side-by-side Door"
              ],
            ),
            ServiceCard(
              title: 'Door Not Closing',
              price: '₹160',
              time: '30 mins',
              description:
                  'Price covers diagnosis visit; spare parts are charged',
              imageUrl: 'assets/Refrigerator/door_not_closing.webp',
              isCustomizable: true,
              customizationOptions: [
                "Single Door",
                "Double Door",
                "Side-by-side Door"
              ],
            ),
            ServiceCard(
              title: 'No Cooling',
              price: '₹160',
              time: '1 hr',
              description:
                  'Price covers diagnosis visit; spare parts are charged',
              imageUrl: 'assets/Refrigerator/no_cooling.webp',
              isCustomizable: true,
              customizationOptions: [
                "Single Door",
                "Double Door",
                "Side-by-side Door"
              ],
            ),
            ServiceCard(
              title: 'No Power',
              price: '₹160',
              time: '1 hr',
              description:
                  'Price covers diagnosis visit; spare parts are charged',
              imageUrl: 'assets/Refrigerator/no_power.webp',
              isCustomizable: true,
              customizationOptions: [
                "Single Door",
                "Double Door",
                "Side-by-side Door"
              ],
            ),
            ServiceCard(
              title: 'Noise Issue',
              price: '₹160',
              time: '1 hr',
              description:
                  'Price covers diagnosis visit; spare parts are charged',
              imageUrl: 'assets/Refrigerator/noise_issue.webp',
              isCustomizable: true,
              customizationOptions: [
                "Single Door",
                "Double Door",
                "Side-by-side Door"
              ],
            ),
            ServiceCard(
              title: 'Water Leakage',
              price: '₹160',
              time: '1 hr',
              description:
                  'Price covers diagnosis visit; spare parts are charged',
              imageUrl: 'assets/Refrigerator/water_leakage.webp',
              isCustomizable: true,
              customizationOptions: [
                "Single Door",
                "Double Door",
                "Side-by-side Door"
              ],
            ),
          ],
        ),
      ),
    );
  }
}
