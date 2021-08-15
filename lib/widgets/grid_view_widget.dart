import 'package:CoolHunter/constants/controllers.dart';
import 'package:CoolHunter/controllers/projects_controller.dart';
import 'package:CoolHunter/models/project.dart';
import 'package:flutter/material.dart';
import 'package:CoolHunter/models/category.dart';
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
              StaggeredTile.fit(index % 3 == 0 ? 6 : 2),
          crossAxisCount: 8,
          itemCount: projectsController.projects.length,
          itemBuilder: (BuildContext context, int index) => _buildCard(index),
        ));
  }

  Widget _buildCard(int index) {
    // print(project.name.toString());
    // final Category category = categories[index];
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
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              data[index].imageURL,
              fit: BoxFit.cover,
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
                  print('add to favourites');
                  favouritesController.addProjectToFavourites(data[index]);
                },
                icon: Icon(BytelIcons.rvb_clients_commercial_coeur),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
