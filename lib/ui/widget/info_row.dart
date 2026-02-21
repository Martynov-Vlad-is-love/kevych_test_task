import 'package:flutter/material.dart';
import 'package:kevych_test_task/ui/widget/info_tile.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InfoTile(title: "Wind", value: "7 km/h"),
          InfoTile(title: "Humidity", value: "65%"),
          InfoTile(title: "Feels", value: "30°"),
        ],
      ),
    );
  }
}