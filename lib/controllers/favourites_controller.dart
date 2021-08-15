import 'package:CoolHunter/constants/controllers.dart';
import 'package:CoolHunter/controllers/authentication_controller.dart';
import 'package:CoolHunter/models/favourite.dart';
import 'package:CoolHunter/models/project.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FavouritesController extends GetxController {
  static FavouritesController instance = Get.find();
  RxDouble totalCartPrice = 0.0.obs;

  void addProjectToFavourites(ProjectModel project) {
    try {
      if (_isProjectAlreadyAdded(project)) {
        Get.snackbar(
            'Check your favourites', '${project.name} is already in it');
      } else {
        String projectId = project.id.toString();
        authenticationController.updateUserData({
          'favourites': FieldValue.arrayUnion([projectId]),
        });
        Get.snackbar('Add to favourites', project.name);
      }
    } catch (e) {
      Get.snackbar('error', e.toString());
    }
  }

  void removeProjectFromFavourites(FavouriteModel project) {
    try {
      String projectId = project.id.toString();
      authenticationController.updateUserData({
        'favourites': FieldValue.arrayRemove([projectId]),
      });
    } catch (e) {
      Get.snackbar('error', e.toString());
    }
  }

  void decreaseQuantity(FavouriteModel item) {
    if (item.quantity == 1) {
      removeProjectFromFavourites(item);
    } else {
      removeProjectFromFavourites(item);
      item.quantity--;
      authenticationController.updateUserData({
        "cart": FieldValue.arrayUnion([item.toJson()])
      });
    }
  }

  void increaseQuantity(FavouriteModel item) {
    removeProjectFromFavourites(item);
    item.quantity++;
    // logger.i({"quantity": item.quantity});
    authenticationController.updateUserData({
      "cart": FieldValue.arrayUnion([item.toJson()])
    });
  }

  bool _isProjectAlreadyAdded(ProjectModel project) {
    // authenticationController.userModel.value.donations.where((element) => element.projectId == project.id).isNotEmpty;

    return authenticationController.userModel.value.favourites
        .contains(project.id.toString());
  }
}
