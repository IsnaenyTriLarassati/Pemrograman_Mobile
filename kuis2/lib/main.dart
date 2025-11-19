import 'User.dart';

void main() {
  User user = User(
    id: 1,
    name: 'Isnaeny',
    email: 'isnaeny@example.com',
    createdAt: DateTime.now(),
  );

  Map<String, dynamic> userJson = user.toJson();
  print('User JSON: $userJson');

  // JSON ke Object Dart
  Map<String, dynamic> jsonData = {
    'id': 2,
    'name': 'Rama',
    'email': 'rama@example.com',
    'created_at': '2025-19-11T10:30:00Z',
  };

  User userFromJson = User.fromJson(jsonData);
  print('User from JSON: ${userFromJson.name}');
}