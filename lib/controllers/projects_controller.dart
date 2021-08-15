import 'package:CoolHunter/constants/firebase.dart';
import 'package:CoolHunter/models/project.dart';
import 'package:get/get.dart';

class ProjectsController extends GetxController {
  static ProjectsController instance = Get.find();
  RxList<ProjectModel> projects = RxList<ProjectModel>([]);
  String projectsCollection = 'projects';

  @override
  void onReady() {
    super.onReady();
    projects.bindStream(getAllProjects());
  }

  Stream<List<ProjectModel>> getAllProjects() => firebaseFirestore
      .collection(projectsCollection)
      .snapshots()
      .map((query) =>
          query.docs.map((item) => ProjectModel.fromMap(item.data())).toList());

  Stream<List<ProjectModel>> getAllUserProjects() => firebaseFirestore
      .collection(projectsCollection)
      .snapshots()
      .map((query) =>
          query.docs.map((item) => ProjectModel.fromMap(item.data())).toList());
}
