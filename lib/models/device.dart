class DeviceModel {
  DeviceModel({
    this.id,
    this.name,
    this.os,
    this.token,
    this.location,
  });

  static const String ID = 'id';
  static const String NAME = 'name';
  static const String OS = 'os';
  static const String TOKEN = 'token';
  static const String LOCATION = 'location';

  late String? id;
  late String? name;
  late String? os;
  late String? token;
  late Map? location;
}
