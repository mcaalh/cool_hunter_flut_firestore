import 'package:CoolHunter/constants/controllers.dart';
import 'package:CoolHunter/models/project.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapController extends GetxController {
  static MapController instance = Get.find();
  late GoogleMapController mapController;
  late PageController pageController;
  RxList<Marker> allMarkers = <Marker>[].obs;
  int prevPage = 0;
  final Rx<BitmapDescriptor> _markerIcon = BitmapDescriptor.defaultMarker.obs;
  late LocationData _currentPosition;
  late String _address, _dateTime;
  Location location = Location();

  @override
  void onInit() {
    super.onInit();
    setMarkerIcon();
    allMarkers.value = getAllMArkers();
    pageController = PageController(initialPage: 0, viewportFraction: 0.8)
      ..addListener(onScroll);
  }

  List<Marker> getAllMArkers() {
    final List<Marker> markers =
        projectsController.projects.map((ProjectModel element) {
      return Marker(
        markerId: MarkerId(element.name),
        draggable: false,
        infoWindow: InfoWindow(
            title: element.name, snippet: element.location.toString()),
        position: _geopointToLatLng(element.location),
        icon: _markerIcon.value,
      );
    }).toList();
    return markers;
  }

  Future<void> setMarkerIcon() async {
    _markerIcon.value = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/logos/makiHead_0.5.png');
  }

  void onScroll() {
    if (pageController.page!.toInt() != prevPage) {
      prevPage = pageController.page!.toInt();
      moveCamera();
    }
  }

  Future<void> moveCamera() async {
    final ProjectModel _project =
        projectsController.projects[pageController.page!.toInt()];

    setShowWindow(MarkerId(_project.name));
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: _geopointToLatLng(_project.location),
          zoom: 18.0,
          bearing: 20.0,
          tilt: 35.0,
        ),
      ),
    );
  }

  void setShowWindow(MarkerId markerId) {
    mapController.showMarkerInfoWindow(markerId);
  }

  LatLng _geopointToLatLng(GeoPoint geoPoint) {
    return LatLng(geoPoint.latitude, geoPoint.longitude);
  }
}
