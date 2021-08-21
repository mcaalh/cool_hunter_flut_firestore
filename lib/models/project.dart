class ProjectModel {
  ProjectModel({
    required this.id,
    required this.imageURL,
    required this.name,
    required this.description,
    // this.price,
    // required this.category,
  });

  ProjectModel.fromMap(Map<String, dynamic> data) {
    id = data[ID] as String;
    imageURL = data[IMAGE] as String;
    name = data[NAME] as String;
    description = data[DESC] as String;
    // category = data[CATEGORY];
    // price = data[PRICE].toDouble();
  }
  static const String ID = 'id';
  static const String IMAGE = 'imageURL';
  static const String NAME = 'name';
  static const String DESC = 'description';
  // static const CATEGORY = "category";
  // static const PRICE = "price";

  late String id;
  late String imageURL;
  late String name;
  late String description;
  // late double? price;
  // late String category;
}
