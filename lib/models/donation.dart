class DonationModel {
  static const ID = "id";
  static const PAYMENT_ID = "paymentId";
  static const CART = "cart";
  static const AMOUNT = "amount";
  static const STATUS = "status";
  static const CREATED_AT = "createdAt";
  static const USER_ID = "userId";
  static const PROJECT_ID = "projectId";

  late String id;
  late String paymentId;
  late String userId;
  late String projectId;
  late String amount;
  late String status;
  late int createdAt;
  // late List cart;

  DonationModel({
    required this.id,
    required this.paymentId,
    required String userId,
    required String projectId,
    required this.amount,
    required this.status,
    required this.createdAt,
  });

  DonationModel.fromMap(Map data) {
    id = data[ID];
    createdAt = data[CREATED_AT];
    paymentId = data[PAYMENT_ID];
    userId = data[USER_ID];
    projectId = data[PROJECT_ID];
    amount = data[AMOUNT];
    status = data[STATUS];
    // cart = data[CART];
  }
}
