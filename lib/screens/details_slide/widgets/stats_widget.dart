import 'package:CoolHunter/models/project.dart';
import 'package:flutter/material.dart';

class StatsWidget extends StatelessWidget {
  const StatsWidget({
    required this.project,
    Key? key,
  }) : super(key: key);

  final ProjectModel project;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            buildStatistic('Dons', project.donations.length),
            buildStatistic('Euro', 3000),
            buildStatistic('Following', 90),
          ],
        ),
      );

  Widget buildStatistic(String text, int value) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '$value',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            text,
            style: const TextStyle(color: Colors.white),
          )
        ],
      );
}
