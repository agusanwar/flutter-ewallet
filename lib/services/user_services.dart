import 'dart:convert';

import 'package:aipay/models/user_edit_form.dart';
import 'package:aipay/models/user_model.dart';
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

  // transfer money users in recent user
  Future<List<UserModel>> getRecentUsers() async {
    try {
      final token = await AuthServices().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/transfer_histories'),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        return List<UserModel>.from(
          jsonDecode(res.body)['data'].map(
            (user) => UserModel.fromJson(user),
          ),
        );
      }
      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

  // transfer money users in get by id users
  Future<List<UserModel>> getUserByUsername(String username) async {
    try {
      final token = await AuthServices().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/users/$username'),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        return List<UserModel>.from(
          jsonDecode(res.body).map(
            (user) => UserModel.fromJson(user),
          ),
        );
      }
      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
