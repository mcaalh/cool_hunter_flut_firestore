import 'package:CoolHunter/constants/controllers.dart';
import 'package:CoolHunter/models/project.dart';
import 'package:CoolHunter/screens/details_slide/widgets/follow_button_widget.dart';
import 'package:CoolHunter/screens/details_slide/widgets/participants_widget.dart';
import 'package:flutter/material.dart';

class PanelHeaderWidget extends StatelessWidget {
  const PanelHeaderWidget({
    required this.project,
    required this.onClickedFollowing,
    Key? key,
  }) : super(key: key);

  final ProjectModel project;
  final VoidCallback onClickedFollowing;

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          // Expanded(child: buildProject()),
          const Expanded(
            child: ParticipantsWidget(),
          ),
          FollowButtonWidget(
            isFollowing: favouritesController.isProjectAlreadyAdded(project),
            onClicked: onClickedFollowing,
          ),
        ],
      );

  Widget buildProject() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            project.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(project.name),
        ],
      );
}
