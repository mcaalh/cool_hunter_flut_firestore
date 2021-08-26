import 'package:CoolHunter/models/project.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProjectModel project = Get.arguments['project'] as ProjectModel;
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SlidingUpPanel(
            parallaxEnabled: true,
            parallaxOffset: 0.5,
            minHeight: MediaQuery.of(context).size.height * 0.4,
            maxHeight: MediaQuery.of(context).size.height * 0.8,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
            body: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Hero(
                tag: project.imageURL,
                child: Image.network(
                  project.imageURL,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            panel: Container(
              margin: const EdgeInsets.only(left: 25, right: 25),
              // width: width,
              height: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFc5e5f3),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        blurRadius: 20,
                        spreadRadius: 1,
                        offset: const Offset(0, 10),
                        color: Colors.grey.withOpacity(0.2))
                  ]),
              child: Container(
                margin: const EdgeInsets.only(
                    left: 20, top: 20, bottom: 20, right: 20),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          project.name,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                        Expanded(child: Container())
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: width,
                      child: Text(
                        project.description,
                        style: const TextStyle(
                            fontSize: 20, color: Color(0xFFb8b8b8)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      thickness: 1.0,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const Icon(Icons.watch_later,
                                color: Color(0xFF69c5df)),
                            const SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Text(
                                  'name',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF303030),
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  '23/10/21',
                                  style: TextStyle(
                                      fontSize: 18, color: Color(0xFFacacac)),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const Icon(Icons.monetization_on,
                                color: Color(0xFFfb8483)),
                            const SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Text(
                                  '499',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF303030),
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  'Prize',
                                  style: TextStyle(
                                      fontSize: 18, color: Color(0xFFacacac)),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const Icon(Icons.star, color: Color(0xFFfbc33e)),
                            const SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Text(
                                  'Top Level',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF303030),
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  'Entry',
                                  style: TextStyle(
                                      fontSize: 18, color: Color(0xFFacacac)),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
