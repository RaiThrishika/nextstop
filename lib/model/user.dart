import 'package:driver_app/model/user_type.dart';

class User {
  final String id;
  final UserType type;

  User({required this.id, required this.type});

 factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      type: UserType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => UserType.driver, // Default value if no match
      ),
    );
  }

  // Method for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name, // Convert enum to its name
    };
  }
}
