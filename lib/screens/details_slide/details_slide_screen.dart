import 'package:CoolHunter/constants/controllers.dart';
import 'package:CoolHunter/models/project.dart';
import 'package:CoolHunter/screens/details_slide/widgets/panel_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DetailsSlideScreen extends StatefulWidget {
  const DetailsSlideScreen({Key? key}) : super(key: key);

  @override
  _DetailsSlideScreenState createState() => _DetailsSlideScreenState();
}

class _DetailsSlideScreenState extends State<DetailsSlideScreen> {
  late PageController pageViewController;
  final PanelController panelController = PanelController();
  int index = 0;

  @override
  void initState() {
    super.initState();
    pageViewController =
        PageController(initialPage: Get.arguments['index'] as int);
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ProjectModel project = projectsController.projects[index];
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        // leading: IconButton(
        //   icon: const Icon(Icons.person_outline),
        //   onPressed: () {},
        // ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: SlidingUpPanel(
        color: Colors.transparent,
        maxHeight: MediaQuery.of(context).size.height * 0.8,
        minHeight: MediaQuery.of(context).size.height * 0.4,
        parallaxEnabled: true,
        parallaxOffset: 0.5,
        controller: panelController,
        body: PageView(
          controller: pageViewController,
          children: projectsController.projects
              .map(
                (ProjectModel project) => Hero(
                  tag: project.imageURL,
                  child: Image.network(
                    project.imageURL,
                    fit: BoxFit.cover,
                  ),
                ),
              )
              .toList(),
          onPageChanged: (int index) => setState(() {
            this.index = index;
          }),
        ),
        panelBuilder: (ScrollController scrollController) => PanelWidget(
          project: project,
          onClickedPanel: panelController.open,
          onClickedFollowing: () =>
              favouritesController.addProjectToFavourites(project),
        ),
      ),
    );
  }
}
