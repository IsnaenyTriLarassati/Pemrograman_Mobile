import 'dart:convert';

import 'user.dart';

void main() {
  print('=== DEBUG: Check JSON Structure ===');

  // Objek Dark ke JSON
  User user = User(
    id: 1,
    name: 'Isnaeny',
    email: 'isnaeny@example.com',
    createdAt: DateTime.now(),
  );

  Map<String, dynamic> userJson = user.toJson();
  print('User.toJSON() result: $userJson');
  print('Filed names : ${userJson.keys.toList()}');

  print('\n=== TEST: JSON to Object ===');

  // GUNAKAN FIELD NAMES YANG SAMA DENGAN YANG ADA DI JSON
  Map<String, dynamic> jsonData = {
    'id': 2,
    'name': 'Rama',
    'email': 'rama@example.com',
    'created_at': '2025-19-11T10:30:00Z',
  };

  // Debug: Print JSON Structure
  print('JSON data to parse: $jsonData');
  print('JSON Keys: ${jsonData.keys.toList()}');
  print('id: ${jsonData['id']} (type: ${jsonData['id'].runtimeType})');
  print('name: ${jsonData['name']} (type: ${jsonData['name'].runtimeType})');
  print('email: ${jsonData['email']} (type: ${jsonData['email'].runtimeType})');
  print('created_at: ${jsonData['created_at']} (type: ${jsonData['created_at'].runtimeType})');

  try {
    User userFromJson = User.fromJson(jsonData);
    print('✅ SUCCESS: User from JSON: $userFromJson');
  } catch (e, stack) {
    print('❌ ERROR: $e');
    print('Stack trace: $stack');
  }

  print('\n=== TEST: Handle Missing Fields ===');

  // Test dengan missing fields
  Map<String, dynamic> incompleteJson = {
    'id': 3,
    // 'name': missing
    'email': 'test@example.com',
    // 'createdAt': missing
  };

  try {
    User userFromIncomplete = User.fromJson(incompleteJson);
    print('User from incomplete JSON: $userFromIncomplete');
  } catch (e) {
    print('Error with incomplete JSON: $e');
  }
}