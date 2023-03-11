import 'dart:convert';

import 'package:aipay/models/topup_form_model.dart';
import 'package:aipay/services/auth_services.dart';
import 'package:http/http.dart' as http;
import '../shared/shared_values.dart';

class TransactionServices {
  Future<String> topUp(TopUpFormModel data) async {
    try {
      // get token from access
      final token = await AuthServices().getToken();

      final res = await http.post(
        Uri.parse(
          '$baseUrl/top_ups',
        ),
        body: data.toJson(),
        headers: {
          'Authorization': token,
        },
      );
      if (res.statusCode == 200) {
        return jsonDecode(res.body)['redirect_url'];
      }
      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}