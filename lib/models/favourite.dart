class FavouriteModel {
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const QUANTITY = "quantity";
  static const COST = "cost";
  static const PRICE = "price";
  static const PROJECT_ID = "projectId";

  late String id;
  late String image;
  late String name;
  late int quantity;
  late double cost;
  late String projectId;
  late double price;

  FavouriteModel({
    required this.projectId,
    required this.id,
    required this.image,
    required this.name,
    required this.quantity,
    required this.cost,
  });

  FavouriteModel.fromMap(Map<String, dynamic> data) {
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    quantity = data[QUANTITY];
    cost = data[COST].toDouble();
    projectId = data[PROJECT_ID];
    price = data[PRICE].toDouble();
  }

  Map toJson() => {
        ID: id,
        PROJECT_ID: projectId,
        IMAGE: image,
        NAME: name,
        QUANTITY: quantity,
        COST: price * quantity,
        PRICE: price
      };
}
