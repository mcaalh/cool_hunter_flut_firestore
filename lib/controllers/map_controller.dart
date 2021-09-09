import 'package:CoolHunter/constants/controllers.dart';
import 'package:CoolHunter/models/coffee.dart';
import 'package:CoolHunter/models/project.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  static MapController instance = Get.find();
  late GoogleMapController mapController;
  late PageController pageController;
  RxList<Marker> allMarkers = <Marker>[].obs;
  int prevPage = 0;

  @override
  void onReady() {
    super.onReady();
    allMarkers.bindStream(getAllMArkers());
  }

  @override
  void onInit() {
    // ignore: avoid_function_literals_in_foreach_calls

    print(allMarkers);
    pageController = PageController(initialPage: 0, viewportFraction: 0.8)
      ..addListener(onScroll);
    super.onInit();
  }

  Stream<List<Marker>> getAllMArkers() {
    final List<Marker> markers =
        projectsController.projects.map((ProjectModel element) {
      return Marker(
          markerId: MarkerId(element.name),
          draggable: false,
          infoWindow: InfoWindow(
              title: element.name, snippet: element.location.toString()),
          position: _geopointToLatLng(element.location));
    }).toList();

    return markers as Stream<List<Marker>>;
  }

  void onScroll() {
    if (pageController.page!.toInt() != prevPage) {
      prevPage = pageController.page!.toInt();
      moveCamera();
    }
  }

  Future<void> moveCamera() async {
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: _geopointToLatLng(
            projectsController.projects[pageController.page!.toInt()].location),
        zoom: 25.0,
        bearing: 20.0,
        tilt: 35.0)));
  }

  LatLng _geopointToLatLng(GeoPoint geoPoint) {
    return LatLng(geoPoint.latitude, geoPoint.longitude);
  }
}
