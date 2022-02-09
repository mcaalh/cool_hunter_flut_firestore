class FavouriteModel {
  FavouriteModel({
    required this.projectId,
    required this.id,
    required this.image,
    required this.name,
    required this.quantity,
    required this.cost,
  });

  FavouriteModel.fromMap(Map<String, dynamic> data) {
    id = data[ID] as String;
    image = data[IMAGE] as String;
    name = data[NAME] as String;
    quantity = data[QUANTITY] as int;
    cost = data[COST] as double;
    projectId = data[PROJECT_ID] as String;
    price = data[PRICE] as double;
  }

  static const String ID = 'id';
  static const String IMAGE = 'image';
  static const String NAME = 'name';
  static const String QUANTITY = 'quantity';
  static const String COST = 'cost';
  static const String PRICE = 'price';
  static const String PROJECT_ID = 'projectId';

  late String id;
  late String image;
  late String name;
  late int quantity;
  late double cost;
  late String projectId;
  late double price;

  Map<String, dynamic> toJson() => <String, dynamic>{
        ID: id,
        PROJECT_ID: projectId,
        IMAGE: image,
        NAME: name,
        QUANTITY: quantity,
        COST: price * quantity,
        PRICE: price
      };
}
