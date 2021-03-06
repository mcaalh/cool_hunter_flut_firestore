class UserModel {
  UserModel({
    required this.name,
    required this.email,
    required this.id,
    required this.donations,
    required this.favourites,
  });

  UserModel.fromSnapshot(dynamic snapshot) {
    final Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;
    name = data['name'] as String;
    email = data['email'] as String;
    id = data['id'] as String;
    donations = data[DONATIONS] as List<dynamic>;
    favourites = data[FAV] as List<dynamic>;
  }

  static const String ID = 'id';
  static const String NAME = 'name';
  static const String EMAIL = 'email';
  static const String DONATIONS = 'donations';
  static const String FAV = 'favourites';

  late String name;
  late String email;
  late String id;
  late List<dynamic> donations;
  late List<dynamic> favourites;
}
