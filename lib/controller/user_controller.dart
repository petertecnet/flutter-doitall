import 'dart:convert';

import 'package:doitall/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserController {
  final String baseUrl = 'https://doitall.com.br/api';

  Future<bool> updateUser(User user) async {
    final url = Uri.parse('$baseUrl/userupdate');
    final body = {
      'id': user.id.toString(),
      'name': user.name,
      'phone': user.phone,
      'email': user.email,
    };
    final response = await http.post(url, body: body);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (jsonData['status'] == 'success') {
        return true;
      } else {
        return false;
      }
    } else {
      throw Exception('Failed to update user.');
    }
  }
}
