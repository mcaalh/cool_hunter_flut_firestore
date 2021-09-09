import 'package:CoolHunter/constants/firebase.dart';
import 'package:CoolHunter/models/project.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ProjectsController extends GetxController {
  static ProjectsController instance = Get.find();
  RxList<ProjectModel> projects = RxList<ProjectModel>([]);
  Rx<ProjectModel> project = ProjectModel(
          id: '',
          imageURL: '',
          name: '',
          description: '',
          donations: <String>[],
          location: GeoPoint(40.7128, -74.0060))
      .obs;
  String projectsCollection = 'projects';

  @override
  void onReady() {
    super.onReady();
    projects.bindStream(getAllProjects());
  }

  Stream<List<ProjectModel>> getAllProjects() => firebaseFirestore
      .collection(projectsCollection)
      .snapshots()
      .map((QuerySnapshot<Map<String, dynamic>> query) => query.docs
          .map((QueryDocumentSnapshot<Map<String, dynamic>> item) =>
              ProjectModel.fromMap(item.data()))
          .toList());

  Stream<List<ProjectModel>> getAllUserProjects() => firebaseFirestore
      .collection(projectsCollection)
      .snapshots()
      .map((QuerySnapshot<Map<String, dynamic>> query) => query.docs
          .map((QueryDocumentSnapshot<Map<String, dynamic>> item) =>
              ProjectModel.fromMap(item.data()))
          .toList());

  Future<DocumentSnapshot<Map<String, dynamic>>> getProject(String projectId) =>
      firebaseFirestore.collection(projectsCollection).doc(projectId).get();

  Future<ProjectModel> getUser(String uid) async {
    try {
      final DocumentSnapshot _doc =
          await firebaseFirestore.collection(projectsCollection).doc(uid).get();

      return ProjectModel.fromSnapshot(_doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
