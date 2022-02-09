class DonationModel {
  DonationModel({
    required this.id,
    required this.paymentId,
    required this.amount,
    required this.status,
    required this.createdAt,
  });

  DonationModel.fromMap(Map data) {
    id = data[ID] as String;
    createdAt = data[CREATED_AT] as int;
    paymentId = data[PAYMENT_ID] as String;
    userId = data[USER_ID] as String;
    projectId = data[PROJECT_ID] as String;
    amount = data[AMOUNT] as String;
    status = data[STATUS] as String;
  }

  static const String ID = 'id';
  static const String PAYMENT_ID = 'paymentId';
  static const String AMOUNT = 'amount';
  static const String STATUS = 'status';
  static const String CREATED_AT = 'createdAt';
  static const String USER_ID = 'userId';
  static const String PROJECT_ID = 'projectId';

  late String id;
  late String paymentId;
  late String userId;
  late String projectId;
  late String amount;
  late String status;
  late int createdAt;
}
