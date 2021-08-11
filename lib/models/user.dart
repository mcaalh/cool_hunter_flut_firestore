class UserModel {
  final String name;
  final String email;

  UserModel({required this.name, required this.email});

  @override
  String toString() => 'User { name: $name, email: $email}';
}
