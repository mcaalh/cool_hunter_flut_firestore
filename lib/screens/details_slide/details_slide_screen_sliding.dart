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
    return SafeArea(
      child: GestureDetector(
        onVerticalDragEnd: (_) {
          Get.back<dynamic>();
        },
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  Get.back<dynamic>();
                },
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
                    (ProjectModel project) => Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                            child: Hero(
                              tag: project.imageURL,
                              child: Image.network(
                                project.imageURL,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const <Widget>[
                                      Text(
                                        'category.titre',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'BouyguesRead',
                                          color: Color(0xFF25465F),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        'category.sousTitres',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'BouyguesRead',
                                          color: Color(0xFF25465F),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
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
        ),
      ),
    );
  }
}
