import 'package:CoolHunter/controllers/app_controller.dart';
import 'package:CoolHunter/controllers/authentication_controller.dart';
import 'package:CoolHunter/controllers/donation_controller.dart';
import 'package:CoolHunter/controllers/favourites_controller.dart';
import 'package:CoolHunter/controllers/projects_controller.dart';

AuthenticationController authenticationController =
    AuthenticationController.instance;

AppController appController = AppController.instance;

ProjectsController projectsController = ProjectsController.instance;
DonationController donationController = DonationController.instance;
FavouritesController favouritesController = FavouritesController.instance;
