import 'package:CoolHunter/constants/controllers.dart';
import 'package:CoolHunter/models/coffee.dart';
import 'package:CoolHunter/screens/map/widgets/map_bottom_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Maps'),
            centerTitle: true,
          ),
          body: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 50.0,
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(
                  initialCameraPosition: const CameraPosition(
                      target: LatLng(48.864716, 2.349014), zoom: 20.0),
                  markers: Set<Marker>.from(mapController.allMarkers),
                  onMapCreated: mapCreated,
                ),
              ),
              Positioned(
                bottom: 20.0,
                child: Container(
                  height: 300.0,
                  width: MediaQuery.of(context).size.width,
                  child: PageView.builder(
                    controller: mapController.pageController,
                    itemCount: projectsController.projects.length,
                    itemBuilder: (BuildContext context, int index) {
                      return MapBottomItemWidget(index: index.toDouble());
                    },
                  ),
                ),
              )
            ],
          ));
    });
  }

  void mapCreated(GoogleMapController controller) {
    mapController.mapController = controller;
  }
}
