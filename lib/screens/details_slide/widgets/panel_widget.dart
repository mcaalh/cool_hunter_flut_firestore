import 'package:CoolHunter/models/project.dart';
import 'package:CoolHunter/screens/details_slide/widgets/panel_header_widget.dart';
import 'package:CoolHunter/screens/details_slide/widgets/stats_widget.dart';
import 'package:flutter/material.dart';

class PanelWidget extends StatelessWidget {
  const PanelWidget({
    required this.project,
    required this.onClickedPanel,
    required this.onClickedFollowing,
    Key? key,
  }) : super(key: key);

  final ProjectModel project;
  final VoidCallback onClickedPanel;
  final VoidCallback onClickedFollowing;

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          StatsWidget(project: project),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.transparent,
              ),
              child: buildProfile(context),
            ),
          ),
        ],
      );

  Widget buildProfile(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onClickedPanel,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              PanelHeaderWidget(
                project: project,
                onClickedFollowing: onClickedFollowing,
              ),
              const SizedBox(height: 24),
              Expanded(child: buildProfileDetails(context, project)),
            ],
          ),
        ),
      );

  Widget buildProfileDetails(BuildContext context, ProjectModel project) =>
      Container(
        padding: const EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width,
        height: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.black45,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              project.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(project.description),
          ],
        ),
      );
}
