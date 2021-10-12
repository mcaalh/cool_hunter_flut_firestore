import 'package:CoolHunter/constants/controllers.dart';
import 'package:CoolHunter/models/project.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapBottomItemWidget extends StatelessWidget {
  MapBottomItemWidget({
    Key? key,
    required this.index,
  }) : super(key: key);
  double index = 0.0;

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = mapController.pageController;
    final ProjectModel _project = projectsController.projects[index.toInt()];
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget? widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          // print(_pageController.position);
          value = _pageController.page!.toDouble() - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: 250.0,
            width: 350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
        onTap: () {
          // moveCamera();
          mapController.setShowWindow(MarkerId(_project.name.toString()));
          mapController.moveCamera();
          print('tap inkwell');
        },
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 20.0,
                ),
                // height: 500.0,
                // width: 275.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 90.0,
                        // width: 90.0,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              topLeft: Radius.circular(10.0)),
                          image: DecorationImage(
                              image: NetworkImage(projectsController
                                  .projects[index.toInt()].imageURL
                                  .toString()),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              projectsController.projects[index.toInt()].name
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 12.5, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              projectsController
                                  .projects[index.toInt()].description
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 12.0, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              projectsController
                                  .projects[index.toInt()].description
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 11.0, fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
