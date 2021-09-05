import 'package:CoolHunter/models/coffee.dart';
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
  void onInit() {
    // ignore: avoid_function_literals_in_foreach_calls
    coffeeShops.forEach((Coffee element) {
      allMarkers.add(Marker(
          markerId: MarkerId(element.shopName),
          draggable: false,
          infoWindow:
              InfoWindow(title: element.shopName, snippet: element.address),
          position: element.locationCoords));
    });
    pageController = PageController(initialPage: 0, viewportFraction: 0.8)
      ..addListener(onScroll);
    super.onInit();
  }

  void onScroll() {
    if (pageController.page!.toInt() != prevPage) {
      prevPage = pageController.page!.toInt();
      moveCamera();
    }
  }

  Future<void> moveCamera() async {
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: coffeeShops[pageController.page!.toInt()].locationCoords,
        zoom: 14.0,
        bearing: 45.0,
        tilt: 45.0)));
  }
}
