import 'package:flutter/material.dart';
import 'package:uoons_services/ServiceCards.dart';

class SomethingElseServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switches and Sockets Services"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ServiceCard(
              title: "Minor Repair/Installation",
              price: "₹99",
              time: "30 mins",
              description:
                  "Price covers diagnosis visit; spare parts are charged",
              imageUrl: 'assets/SwitchesSockets/minor_repair_installation.webp',
              isCustomizable: false,
            ),
            ServiceCard(
              title: "Book an Electrician",
              price: "₹49",
              time: "N/A",
              description:
                  "Price covers diagnosis visit; spare parts are charged",
              imageUrl: 'assets/SwitchesSockets/book_an_electrician.webp',
              isCustomizable: false,
            ),
          ],
        ),
      ),
    );
  }
}
