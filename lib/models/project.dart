class ProjectModel {
  static const ID = "id";
  static const IMAGE = "imageURL";
  static const NAME = "name";
  static const DESC = "description";
  // static const CATEGORY = "category";
  // static const PRICE = "price";

  late String id;
  late String imageURL;
  late String name;
  late String description;
  // late double? price;
  // late String category;

  ProjectModel({
    required this.id,
    required this.imageURL,
    required this.name,
    required this.description,
    // this.price,
    // required this.category,
  });

  ProjectModel.fromMap(Map<String, dynamic> data) {
    id = data[ID];
    imageURL = data[IMAGE];
    name = data[NAME];
    description = data[DESC];
    // category = data[CATEGORY];
    // price = data[PRICE].toDouble();
  }
}
