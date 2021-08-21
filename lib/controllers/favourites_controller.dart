import 'package:CoolHunter/constants/controllers.dart';
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
        Get.snackbar<dynamic>(
            'Check your favourites', '${project.name} is already in it');
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

  void removeProjectFromFavourites(FavouriteModel project) {
    try {
      final String projectId = project.id.toString();
      authenticationController.updateUserData(<String, dynamic>{
        'favourites': FieldValue.arrayRemove(<dynamic>[projectId]),
      });
    } catch (e) {
      Get.snackbar<dynamic>('error', e.toString());
    }
  }

  void decreaseQuantity(FavouriteModel item) {
    if (item.quantity == 1) {
      removeProjectFromFavourites(item);
    } else {
      removeProjectFromFavourites(item);
      item.quantity--;
      authenticationController.updateUserData(<String, dynamic>{
        'cart': FieldValue.arrayUnion(<dynamic>[item.toJson()])
      });
    }
  }

  void increaseQuantity(FavouriteModel item) {
    removeProjectFromFavourites(item);
    item.quantity++;
    // logger.i({"quantity": item.quantity});
    authenticationController.updateUserData(<String, dynamic>{
      'cart': FieldValue.arrayUnion(<dynamic>[item.toJson()])
    });
  }

  bool _isProjectAlreadyAdded(ProjectModel project) {
    // authenticationController.userModel.value.donations.where((element) => element.projectId == project.id).isNotEmpty;

    return authenticationController.userModel.value.favourites
        .contains(project.id.toString());
  }
}
