import 'package:CoolHunter/models/donation.dart';
import 'package:CoolHunter/models/favourite.dart';
import 'package:CoolHunter/screens/favourites/widgets/favourite_card_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";
  static const DONATIONS = "donations";
  static const FAV = "favourites";

  late String name;
  late String email;
  late String id;
  // late List<DonationModel> donations;
  late List<dynamic> favourites;

  UserModel({
    required this.name,
    required this.email,
    required this.id,
    // required this.donations,
    required this.favourites,
  });

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<dynamic, dynamic> data = snapshot.data()! as Map<dynamic, dynamic>;
    name = data['name'];
    email = data['email'];
    id = data['id'];
    // donations = data[DONATIONS];
    // donations = _convertDonationItems(data[DONATIONS] ?? []);
    favourites = data[FAV];
  }

  List<DonationModel> _convertDonationItems(List donationFromDb) {
    List<DonationModel> _result = [];
    if (donationFromDb.length > 0) {
      donationFromDb.forEach((element) {
        _result.add(DonationModel.fromMap(element));
      });
    }
    return _result;
  }

  // List donationItemsToJson() =>
  //     favourites.map((item) => item.toJson()).toList();
}
