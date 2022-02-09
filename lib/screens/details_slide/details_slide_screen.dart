import 'package:CoolHunter/constants/controllers.dart';
import 'package:CoolHunter/models/project.dart';
import 'package:CoolHunter/theme/main_theme.dart';
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
    return SafeArea(
      child: GestureDetector(
        onVerticalDragEnd: (_) {
          print('drag vertical');
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
          body: PageView(
            controller: pageViewController,
            children: projectsController.projects
                .map(
                  (ProjectModel project) => Column(
                    children: <Widget>[
                      Expanded(
                        child: CardDetails(project: project),
                      ),
                    ],
                  ),
                )
                .toList(),
            onPageChanged: (int index) => setState(() {
              this.index = index;
            }),
          ),
        ),
      ),
    );
  }
}

class CardDetails extends StatelessWidget {
  const CardDetails({
    Key? key,
    required this.project,
  }) : super(key: key);
  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20.0),
            ),
            child: Hero(
              tag: project.imageURL,
              child: Image.network(
                project.imageURL,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      project.name,
                      style: kTitleHome,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      project.description,
                      style: kTitleCategory,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'Short Description',
                      style: kStyleShortDescription,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          onPressed: () => print('SHARE Button'),
                          icon: const Icon(Icons.ios_share),
                        ),
                        const CustomButton(
                          isPrimary: true,
                          customText: 'Visit',
                        ),
                        const CustomButton(
                          isPrimary: false,
                          customText: 'Support',
                        ),
                        IconButton(
                          onPressed: () => print('MORE Button'),
                          icon: const Icon(Icons.more_horiz),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.isPrimary,
    required this.customText,
  }) : super(key: key);

  final String customText;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(customText),
      style: TextButton.styleFrom(
        backgroundColor:
            isPrimary ? kStandardButtonColor : kSecondaryBackgroundColor,
        padding: const EdgeInsets.all(15.0),
        primary: kStandardLabelColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
      ),
      onPressed: () {
        print(customText);
      },
    );
  }
}
