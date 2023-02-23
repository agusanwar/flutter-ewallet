import 'dart:convert';

import 'package:aipay/models/user_edit_form.dart';
import 'package:aipay/services/auth_services.dart';
import 'package:aipay/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class UserServices {
  // method
  Future<void> updateUser(UserEditFormModel data) async {
    try {
      final token = await AuthServices().getToken();

      final res = await http.put(
        Uri.parse('$baseUrl/users'),
        body: data.toJson(),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
