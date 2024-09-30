import 'package:flutter/material.dart';
import 'package:uoons_services/ServiceCards.dart';

class LightServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Light Services"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ServiceCard(
              title: "Ceiling Light Installation",
              price: "₹129",
              time: "-",
              description:
                  "Covers installation only. Light/spare parts sourced",
              imageUrl: 'assets/light/ceiling_light_installation.jpg',
            ),
            ServiceCard(
              title: "Tubelight Installation/Repair",
              price: "₹69",
              time: "-",
              description:
                  "Covers installation only. Light/spare parts sourced",
              imageUrl: 'assets/light/tubelight_installation.jpg',
            ),
            ServiceCard(
              title: "Wall Light Installation",
              price: "₹99",
              time: "-",
              description:
                  "Covers installation only. Light/spare parts sourced",
              imageUrl: 'assets/light/wall_light_installation.jpg',
            ),
            ServiceCard(
              title: "Bulb/CFL/LED Installation (upto 5)",
              price: "₹69",
              time: "-",
              description:
                  "Covers installation only. Light/spare parts sourced",
              imageUrl: 'assets/light/bulb_installation.jpg',
            ),
            ServiceCard(
              title: "Bulb/Tubelight Holder Installation",
              price: "₹69",
              time: "-",
              description:
                  "Covers installation only. Light/spare parts sourced",
              imageUrl: 'assets/light/bulb_holder_installation.jpg',
            ),
            ServiceCard(
              title: "Replace CFL to LED",
              price: "₹129",
              time: "-",
              description: "Covers installation only. CFL/spare parts sourced",
              imageUrl: 'assets/light/replace_cfl_to_led.jpg',
            ),
            ServiceCard(
              title: "Decorative Lights Installation",
              price: "₹89",
              time: "-",
              description: "Covers installation only. CFL/spare parts sourced",
              imageUrl: 'assets/light/decorative_lights_installation.jpg',
            ),
            ServiceCard(
              title: "Decorative Lights Uninstallation",
              price: "₹99",
              time: "-",
              description: "Covers installation only. Spare parts sourced",
              imageUrl: 'assets/light/decorative_lights_uninstallation.jpg',
            ),
            ServiceCard(
              title: "Decorative Lantern Installation",
              price: "₹99",
              time: "-",
              description: "Covers installation only. Spare parts sourced",
              imageUrl: 'assets/light/decorative_lantern_installation.jpg',
            ),
            ServiceCard(
              title: "Chandelier Installation",
              price: "₹549",
              time: "-",
              description: "Covers installation only. Spare parts sourced",
              imageUrl: 'assets/light/chandelier_installation.jpg',
            ),
          ],
        ),
      ),
    );
  }
}
