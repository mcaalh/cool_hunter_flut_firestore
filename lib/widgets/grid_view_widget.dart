import 'package:CoolHunter/constants/controllers.dart';
import 'package:CoolHunter/controllers/projects_controller.dart';
import 'package:CoolHunter/models/project.dart';
import 'package:CoolHunter/screens/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:CoolHunter/models/category.dart';
import 'package:CoolHunter/theme/bytel_icons_icons.dart';
import 'package:CoolHunter/theme/main_theme.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

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
                Get.to<dynamic>(const DetailsScreen());
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  data[index].imageURL,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () => print('up your cool attitude'),
                  icon: const Icon(
                    BytelIcons.rvb_divers_divers_motivation,
                    color: Colors.black,
                  ),
                ),

                // const Text('data'),
                IconButton(
                  color: Colors.redAccent,
                  onPressed: () {
                    favouritesController.addProjectToFavourites(data[index]);
                  },
                  icon: Icon(
                    BytelIcons.rvb_clients_commercial_coeur,
                    color:
                        favouritesController.isProjectAlreadyAdded(data[index])
                            ? const Color(0xFFCC0047)
                            : Colors.grey,
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
