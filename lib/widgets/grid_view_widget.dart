import 'package:CoolHunter/constants/controllers.dart';
import 'package:CoolHunter/models/project.dart';
import 'package:CoolHunter/theme/cool_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:CoolHunter/theme/bytel_icons_icons.dart';
import 'package:CoolHunter/theme/main_theme.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class GridViewWidget extends StatelessWidget {
  GridViewWidget({
    Key? key,
  }) : super(key: key);

  RxList<ProjectModel> data = projectsController.projects;

  @override
  Widget build(BuildContext context) {
    return Obx(() => StaggeredGridView.countBuilder(
          staggeredTileBuilder: (int index) =>
              StaggeredTile.fit(index % 3 == 0 ? 6 : 3),
          crossAxisCount: 9,
          itemCount: projectsController.projects.length,
          itemBuilder: (BuildContext context, int index) => _buildCard(index),
        ));
  }

  Widget _buildCard(int index) {
    // print(project.name.toString());
    // final Category category = categories[index];
    final ProjectModel project = data[index];
    return Obx(() {
      return Card(
        elevation: 0,
        color: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(kRoundedCorner),
          ),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Get.toNamed<dynamic>('/details-slide/',
                    arguments: <String, dynamic>{
                      'project': project,
                      'index': index,
                    });
                // Get.toNamed<dynamic>('/details/',
                //     arguments: <String, ProjectModel>{
                //       'project': project,
                //     });
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: <Widget>[
                    Hero(
                      tag: project.imageURL,
                      child: Image.network(
                        project.imageURL,
                        fit: BoxFit.cover,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          favouritesController.addProjectToFavourites(project);
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: favouritesController
                                  .isProjectAlreadyAdded(project)
                              ? const Color(0xFFCC0047)
                              : Colors.grey,
                        ))
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () =>
                      favouritesController.addProjectToFavourites(project),
                  icon: Icon(
                    CoolIcons.f8896490c87ab7e94bf37195d14fddf5,
                    color: favouritesController.isProjectAlreadyAdded(project)
                        ? const Color(0xFFFFA200)
                        : Colors.grey,
                  ),
                ),

                // const Text('data'),
                IconButton(
                  color: Colors.redAccent,
                  onPressed: () {
                    donationController.applePayPayment();
                  },
                  icon: Icon(
                    Icons.euro,
                    color: Colors.green[400],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
