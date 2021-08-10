import 'package:flutter/material.dart';
import 'package:CoolHunter/models/category.dart';
import 'package:CoolHunter/theme/bytel_icons_icons.dart';
import 'package:CoolHunter/theme/main_theme.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({Key? key, required this.categories}) : super(key: key);

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      staggeredTileBuilder: (int index) =>
          StaggeredTile.fit(index % 3 == 0 ? 4 : 2),
      crossAxisCount: 8,
      itemCount: 50,
      itemBuilder: (BuildContext context, int index) => _buildCard(index),
    );
  }

  Widget _buildCard(int index) {
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              'https://source.unsplash.com/random?sig=$index',
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: <Widget>[
              IconButton(
                onPressed: () => print('up your cool attitude'),
                icon: const Icon(
                  BytelIcons.rvb_divers_divers_motivation,
                  color: Colors.white,
                ),
              )
            ],
          ),
          const Text('data')
        ],
      ),
    );
  }
}
