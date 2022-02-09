import 'package:CoolHunter/constants/controllers.dart';
import 'package:CoolHunter/models/project.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FavouritesController extends GetxController {
  static FavouritesController instance = Get.find();
  RxDouble totalCartPrice = 0.0.obs;
  RxBool isFavourite = false.obs;

  void addProjectToFavourites(ProjectModel project) {
    try {
      if (isProjectAlreadyAdded(project)) {
        removeProjectFromFavourites(project);
        Get.snackbar<dynamic>('removed', '${project.name} from favourites');
      } else {
        final String projectId = project.id.toString();
        authenticationController.updateUserData(<String, dynamic>{
          'favourites': FieldValue.arrayUnion(<dynamic>[projectId]),
        });
        Get.snackbar<dynamic>('Add to favourites', project.name);
      }
    } catch (e) {
      Get.snackbar<dynamic>('error', e.toString());
    }
  }

  void removeProjectFromFavourites(ProjectModel project) {
    try {
      final String projectId = project.id.toString();
      authenticationController.updateUserData(<String, dynamic>{
        'favourites': FieldValue.arrayRemove(<dynamic>[projectId]),
      });
    } catch (e) {
      Get.snackbar<dynamic>('error', e.toString());
    }
  }

  bool isProjectAlreadyAdded(ProjectModel project) {
    return authenticationController.userModel.value.favourites
        .contains(project.id.toString());
  }
}
