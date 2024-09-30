import 'package:flutter/material.dart';
import 'package:uoons_services/ServiceCards.dart';

class MCBServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MCB and Fuses Services"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ServiceCard(
              title: "MCB Fuse Replacement",
              price: "₹79",
              time: "30 mins",
              description:
                  "Covers replacement only. MCB fuse/spare parts sourced",
              imageUrl: 'assets/MCB/mcb_fuse_replacement.webp',
              isCustomizable: false,
            ),
            ServiceCard(
              title: "Sub Meter Installation",
              price: "₹219",
              time: "1 hr",
              description:
                  "Covers installation only. Sub meter/spare parts sourced",
              imageUrl: 'assets/MCB/sub_meter_installation.webp',
              isCustomizable: false,
            ),
            ServiceCard(
              title: "Double Pole MCB Installation",
              price: "₹149",
              time: "45 mins",
              description: "Covers installation only. MCB/spare parts sourced",
              imageUrl: 'assets/MCB/double_pole_mcb_installation.webp',
              isCustomizable: false,
            ),
            ServiceCard(
              title: "3 Phase Changeover Switch Installation",
              price: "₹249",
              time: "1.5 hrs",
              description:
                  "Covers installation only. Switch/spare parts sourced",
              imageUrl:
                  'assets/MCB/three_phase_changeover_switch_installation.webp',
              isCustomizable: false,
            ),
            ServiceCard(
              title: "Single Pole MCB Installation",
              price: "₹99",
              time: "30 mins",
              description:
                  "Covers installation only. Switch/spare parts sourced",
              imageUrl: 'assets/MCB/single_pole_mcb_installation.webp',
              isCustomizable: false,
            ),
          ],
        ),
      ),
    );
  }
}
