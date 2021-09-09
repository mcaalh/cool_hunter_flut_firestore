import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ProjectModel {
  ProjectModel({
    required this.id,
    required this.imageURL,
    required this.name,
    required this.description,
    required this.donations,
    required this.location,
    // this.price,
    // required this.category,
  });

  ProjectModel.fromSnapshot(DocumentSnapshot<dynamic> snapshot) {
    final Map<dynamic, dynamic> data =
        snapshot.data()! as Map<dynamic, dynamic>;
    id = data[ID] as String;
    imageURL = data[IMAGE] as String;
    name = data[NAME] as String;
    description = data[DESC] as String;
    donations = data[DONATIONS] as List<dynamic>;
    location = data[LOCATION] as GeoPoint;
  }
  ProjectModel.fromMap(Map<String, dynamic> data) {
    id = data[ID] as String;
    imageURL = data[IMAGE] as String;
    name = data[NAME] as String;
    description = data[DESC] as String;
    donations = data[DONATIONS] as List<dynamic>;
    location = data[LOCATION] as GeoPoint;
    // category = data[CATEGORY];
    // price = data[PRICE].toDouble();
  }
  static const String ID = 'id';
  static const String IMAGE = 'imageURL';
  static const String NAME = 'name';
  static const String DESC = 'description';
  static const String DONATIONS = 'donations';
  static const String LOCATION = 'location';
  // static const CATEGORY = "category";
  // static const PRICE = "price";

  late String id;
  late String imageURL;
  late String name;
  late String description;
  late List<dynamic> donations;
  late GeoPoint location;
  // late double? price;
  // late String category;
}
