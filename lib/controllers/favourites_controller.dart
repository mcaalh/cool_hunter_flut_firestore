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

  // void decreaseQuantity(FavouriteModel item) {
  //   if (item.quantity == 1) {
  //     removeProjectFromFavourites(item);
  //   } else {
  //     removeProjectFromFavourites(item);
  //     item.quantity--;
  //     authenticationController.updateUserData(<String, dynamic>{
  //       'cart': FieldValue.arrayUnion(<dynamic>[item.toJson()])
  //     });
  //   }
  // }

  // void increaseQuantity(FavouriteModel item) {
  //   removeProjectFromFavourites(item);
  //   item.quantity++;
  //   // logger.i({"quantity": item.quantity});
  //   authenticationController.updateUserData(<String, dynamic>{
  //     'cart': FieldValue.arrayUnion(<dynamic>[item.toJson()])
  //   });
  // }

  bool isProjectAlreadyAdded(ProjectModel project) {
    // authenticationController.userModel.value.donations.where((element) => element.projectId == project.id).isNotEmpty;

    return authenticationController.userModel.value.favourites
        .contains(project.id.toString());
  }
}
